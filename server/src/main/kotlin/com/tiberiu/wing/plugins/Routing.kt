package com.tiberiu.wing.plugins

import com.tiberiu.wing.routing.authRoute
import com.tiberiu.wing.routing.userRoute
import com.tiberiu.wing.routing.workoutPlans
import com.tiberiu.wing.routing.workoutRoute
import com.tiberiu.wing.routing.workoutTemplates
import com.tiberiu.wing.service.JwtService
import com.tiberiu.wing.service.UserService
import com.tiberiu.wing.service.WorkoutService
import io.ktor.server.application.*
import io.ktor.server.routing.route
import io.ktor.server.routing.routing

fun Application.configureRouting(
    userService: UserService,
    jwtService: JwtService,
    workoutService: WorkoutService
) {
    routing {
        route("/api/auth") {
            authRoute(jwtService)
        }

        route("/api/user") {
            userRoute(userService)
        }

        route("api/workout") {
            workoutRoute(workoutService)
        }

        route("api/workoutTemplates") {
            workoutTemplates(workoutService)
        }

        route("api/workoutPlans") {
            workoutPlans(workoutService)
        }
    }
}
