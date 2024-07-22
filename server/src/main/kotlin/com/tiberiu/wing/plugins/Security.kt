package com.tiberiu.wing.plugins

import com.tiberiu.wing.service.JwtService
import io.ktor.server.application.Application
import io.ktor.server.auth.authentication
import io.ktor.server.auth.jwt.jwt

fun Application.configureSecurity(jwtService: JwtService) {
    authentication {
        jwt {
            realm = jwtService.realm
            verifier(jwtService.jwtVerifier)

            validate { jwtCredential ->
                jwtService.customValidator(jwtCredential)
            }
        }
    }
}