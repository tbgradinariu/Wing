package com.tiberiu.wing

import com.tiberiu.wing.repository.UserDatabaseRepository
import com.tiberiu.wing.repository.WorkoutPlansDatabaseRepository
import com.tiberiu.wing.plugins.configureRouting
import com.tiberiu.wing.service.UserService
import configureDatabases
import configureSerialization
import io.ktor.server.application.*
import io.ktor.server.netty.*

fun main(args: Array<String>) {
    EngineMain.main(args)
}

fun Application.module() {
    configureDatabases(environment.config)
    configureRouting(UserService(UserDatabaseRepository()))
    configureSerialization()
}