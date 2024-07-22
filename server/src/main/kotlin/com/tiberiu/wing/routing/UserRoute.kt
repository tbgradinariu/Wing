package com.tiberiu.wing.routing

import com.tiberiu.wing.model.User
import com.tiberiu.wing.repository.sha256Hash
import com.tiberiu.wing.routing.request.UserRequest
import com.tiberiu.wing.routing.response.UserResponse
import com.tiberiu.wing.service.UserService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.*
import io.ktor.server.auth.authenticate
import io.ktor.server.auth.jwt.JWTPrincipal
import io.ktor.server.auth.principal
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.datetime.LocalDate

fun Route.userRoute(
    userService: UserService
) {
    post {
        val userRequest = call.receive<UserRequest>()
        val createdUser = userService.addUser(userRequest.toModel()) ?: return@post call.respond(
            HttpStatusCode.BadRequest
        )

        call.response.header(name = "id", value = createdUser.id.toString())
        call.respond(HttpStatusCode.Created)
    }

    authenticate {
        get {
            val users = userService.getAllUsers()
            call.respond(users.map(User::toResponse))
        }

        get("/{id}") {
            val id: Int = call.parameters["id"]?.toIntOrNull() ?: return@get call.respond(HttpStatusCode.BadRequest)

            val foundUser = userService.findById(id) ?: return@get call.respond(HttpStatusCode.NotFound)

            if (foundUser.email != extractPrincipalEmail(call)) {
                return@get call.respond(HttpStatusCode.NotFound)
            }

            call.respond(foundUser.toResponse())
        }
    }
}

fun extractPrincipalEmail(call: ApplicationCall): String? =
    call.principal<JWTPrincipal>()?.payload?.getClaim("email")?.asString()

private fun User.toResponse(): UserResponse =
    UserResponse(id = this.id, email = this.email)

private fun UserRequest.toModel(): User =
    User(
        id = 1,
        name = "Bobitza",
        passwordHash = this.password.sha256Hash(),
        email = this.email,
        dateOfBirth = LocalDate(1989, 3, 27)
    )
