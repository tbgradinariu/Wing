package com.tiberiu.wing.routing

import com.tiberiu.wing.model.CreateWorkoutPlanRequest
import com.tiberiu.wing.model.CreateWorkoutTemplateRequest
import com.tiberiu.wing.model.User
import com.tiberiu.wing.model.WorkoutTemplate
import com.tiberiu.wing.routing.request.UserRequest
import com.tiberiu.wing.service.WorkoutService
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.request.receive
import io.ktor.server.response.header
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get
import io.ktor.server.routing.post

fun Route.workoutRoute(
    workoutService: WorkoutService
) {
    get("/exerciseTemplates") {
        val exerciseTemplates = workoutService.getExerciseTemplates()
        call.respond(exerciseTemplates)
    }
}

fun Route.workoutTemplates(
    workoutService: WorkoutService
) {
    post {
        try {
            val workoutTemplateRequest = call.receive<CreateWorkoutTemplateRequest>()
            if (workoutService.createWorkoutTemplate(workoutTemplateRequest)) {
                call.respond(HttpStatusCode.Created)
            } else {
                call.respond(HttpStatusCode.BadRequest)
            }
        } catch (exception: Exception) {
            return@post call.respond(
                HttpStatusCode.BadRequest
            )
        }
    }
}

fun Route.workoutPlans(
    workoutService: WorkoutService
) {
    get("/{userId}") {
        val userId = call.parameters["userId"]?.toIntOrNull() ?: return@get call.respond(HttpStatusCode.BadRequest)
        val workoutPlans = workoutService.getWorkoutPlansForUser(userId)
        call.respond(workoutPlans)
    }
    post {
        try {
            val workoutPlanRequest = call.receive<CreateWorkoutPlanRequest>()
            if(workoutService.createWorkoutPlan(workoutPlanRequest)) {
                call.respond(HttpStatusCode.Created)
            } else {
                call.respond(HttpStatusCode.BadRequest)
            }
        } catch (exception: Exception) {
            return@post call.respond(
                HttpStatusCode.BadRequest
            )
        }
    }
}