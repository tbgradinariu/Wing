package com.tiberiu.wing

import PostgresTaskRepository
import SERVER_PORT
import com.tiberiu.wing.plugins.configureRouting
import configureDatabases
import configureSerialization
import io.ktor.server.application.*
import io.ktor.server.netty.*

fun main(args: Array<String>) {
    EngineMain.main(args)
}

fun Application.module() {
    val repository = PostgresTaskRepository()

    print("tibi ${environment.config.propertyOrNull("ktor.deployment.port")}")
    configureRouting()
    configureSerialization(repository)
    configureDatabases(environment.config)
}