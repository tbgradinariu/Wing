import com.tiberiu.wing.model.user.UserRepository
import com.tiberiu.wing.model.workoutplans.WorkoutPlanRepository
import io.ktor.http.*
import io.ktor.serialization.kotlinx.json.*
import io.ktor.server.application.*
import io.ktor.server.plugins.contentnegotiation.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureSerialization(repository: UserRepository, workoutPlansRepository: WorkoutPlanRepository) {
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
        }

        route("workoutPlans") {
            get("/{userId}") {
                try {
                    val userId = call.parameters["userId"]?.toInt()
                    if (userId == null) {
                        call.respond(HttpStatusCode.BadRequest)
                        return@get
                    }
                    val plans = workoutPlansRepository.getWorkoutPlansForUser(userId)
                    call.respond(plans)
                } catch (ex: NumberFormatException) {
                    call.respond(HttpStatusCode.BadRequest)
                }
            }
        }
    }
}