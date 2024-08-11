package com.tiberiu.wing

import com.tiberiu.wing.repository.UserDatabaseRepository
import com.tiberiu.wing.plugins.configureRouting
import com.tiberiu.wing.plugins.configureSecurity
import com.tiberiu.wing.repository.WorkoutPlansDatabaseRepository
import com.tiberiu.wing.service.JwtService
import com.tiberiu.wing.service.UserService
import com.tiberiu.wing.service.WorkoutService
import configureDatabases
import configureSerialization
import io.ktor.server.application.*
import io.ktor.server.netty.*

fun main(args: Array<String>) {
    EngineMain.main(args)
}

fun Application.module() {
    configureDatabases(environment.config)

    val userRepository = UserDatabaseRepository()
    val userService = UserService(userRepository)
    val jwtService = JwtService(this, userService)
    val workoutRepository = WorkoutPlansDatabaseRepository()
    val workoutService = WorkoutService(workoutRepository)

    configureSecurity(jwtService)
    configureRouting(userService, jwtService, workoutService)
    configureSerialization()
}