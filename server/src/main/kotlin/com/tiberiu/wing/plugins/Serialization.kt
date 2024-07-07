import com.tiberiu.wing.model.UserRepository
import io.ktor.http.*
import io.ktor.serialization.kotlinx.json.*
import io.ktor.server.application.*
import io.ktor.server.plugins.contentnegotiation.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureSerialization(repository: UserRepository) {
    install(ContentNegotiation) {
        json()
    }
    routing {

        route("/users") {
            get {
                val users = repository.getAllUsers()
                call.respond(users)
            }

            get("/byEmail/{email}") {
                val email = call.parameters["email"]
                if (email == null) {
                    call.respond(HttpStatusCode.BadRequest)
                    return@get
                }
                val user = repository.getUserByEmail(email = email)
                if (user == null) {
                    call.respond(HttpStatusCode.NotFound)
                    return@get
                }
                call.respond(user)
            }

//            post {
//                try {
//                    val task = call.receive<Task>()
//                    repository.addTask(task)
//                    call.respond(HttpStatusCode.NoContent)
//                } catch (ex: IllegalStateException) {
//                    call.respond(HttpStatusCode.BadRequest)
//                } catch (ex: JsonConvertException) {
//                    call.respond(HttpStatusCode.BadRequest)
//                }
//            }
//
//            delete("/{taskName}") {
//                val name = call.parameters["taskName"]
//                if (name == null) {
//                    call.respond(HttpStatusCode.BadRequest)
//                    return@delete
//                }
//                if (repository.removeTask(name)) {
//                    call.respond(HttpStatusCode.NoContent)
//                } else {
//                    call.respond(HttpStatusCode.NotFound)
//                }
//            }
        }
    }
}