package com.tiberiu.wing.plugins

import com.tiberiu.wing.routing.userRoute
import com.tiberiu.wing.service.UserService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.*
import io.ktor.server.response.respond
import io.ktor.server.routing.get
import io.ktor.server.routing.route
import io.ktor.server.routing.routing

fun Application.configureRouting(
    userService: UserService
) {
    routing {
        route("/api/user") {
            userRoute(userService)
        }

//        route("workoutPlans") {
//            get("/{userId}") {
//                try {
//                    val userId = call.parameters["userId"]?.toInt()
//                    if (userId == null) {
//                        call.respond(HttpStatusCode.BadRequest)
//                        return@get
//                    }
//                    val plans = workoutPlansRepository.getWorkoutPlansForUser(userId)
//                    call.respond(plans)
//                } catch (ex: NumberFormatException) {
//                    call.respond(HttpStatusCode.BadRequest)
//                }
//            }
//        }
    }
}
