package com.tiberiu.wing.routing

import com.tiberiu.wing.service.JwtService
import com.tiberiu.wing.service.routing.request.LoginRequest
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.request.receive
import io.ktor.server.response.respond
import io.ktor.server.routing.Route
import io.ktor.server.routing.post

fun Route.authRoute(jwtService: JwtService) {

    post {
        val loginRequest = call.receive<LoginRequest>()

        val token = jwtService.createJwtToken(loginRequest)
        token?.let {
            call.respond(hashMapOf("token" to it))
        } ?: call.respond(HttpStatusCode.Unauthorized)
    }

}