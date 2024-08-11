package com.tiberiu.wing.routing

import com.tiberiu.wing.model.User
import com.tiberiu.wing.service.WorkoutService
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.get

fun Route.workoutRoute(
    workoutService: WorkoutService
) {
    get("/exerciseTemplates") {
        val exerciseTemplates = workoutService.getExerciseTemplates()
        call.respond(exerciseTemplates)
    }
}