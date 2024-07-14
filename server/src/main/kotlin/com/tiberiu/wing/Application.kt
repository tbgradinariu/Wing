package com.tiberiu.wing

import com.tiberiu.wing.model.user.UserDatabaseRepository
import com.tiberiu.wing.model.workoutplans.WorkoutPlansDatabaseRepository
import com.tiberiu.wing.plugins.configureRouting
import configureDatabases
import configureSerialization
import io.ktor.server.application.*
import io.ktor.server.netty.*

fun main(args: Array<String>) {
    EngineMain.main(args)
}

fun Application.module() {
    print("tibi ${environment.config.propertyOrNull("ktor.deployment.port")}")
    configureRouting()
    configureDatabases(environment.config)
    configureSerialization(UserDatabaseRepository(), WorkoutPlansDatabaseRepository())
}