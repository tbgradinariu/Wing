package com.tiberiu.wing.service

import com.auth0.jwt.JWT
import com.auth0.jwt.JWTVerifier
import com.auth0.jwt.algorithms.Algorithm
import com.tiberiu.wing.repository.sha256Hash
import com.tiberiu.wing.service.routing.request.LoginRequest
import io.ktor.server.application.Application
import io.ktor.server.auth.Credential
import io.ktor.server.auth.jwt.JWTCredential
import io.ktor.server.auth.jwt.JWTPrincipal
import java.util.Date

class JwtService(
    private val application: Application,
    private val userService: UserService
) {
    private val secret = getConfigProperty("jwt.secret")
    private val issuer = getConfigProperty("jwt.issuer")
    private val audience = getConfigProperty("jwt.audience")

    val realm = getConfigProperty("jwt.realm")

    val jwtVerifier: JWTVerifier =
        JWT.require(
            Algorithm.HMAC256(secret))
            .withAudience(audience)
            .withIssuer(issuer)
            .build()

    suspend fun createJwtToken(loginRequest: LoginRequest): String? {
        val foundUser = userService.findByEmail(loginRequest.email)

        return if (foundUser != null && foundUser.passwordHash == loginRequest.password.sha256Hash()) {
            JWT
                .create()
                .withAudience(audience)
                .withIssuer(issuer)
                .withClaim("email", foundUser.email)
                .withExpiresAt(Date(System.currentTimeMillis() + 3_600_000))
                .sign(Algorithm.HMAC256(secret))
        } else null
    }

    suspend fun customValidator(credential: JWTCredential) : JWTPrincipal? {
        val email = extractEmail(credential)
        val foundUser = email?.let { userService.findByEmail(it) }

        return foundUser?.let {
            if (audienceMatches(credential)) {
                JWTPrincipal(credential.payload)
            } else null
        }
    }

    private fun audienceMatches(credential: JWTCredential): Boolean =
        credential.payload.audience.contains(audience)

    private fun extractEmail(credential: JWTCredential): String? =
        credential.payload.getClaim("email").asString()

    private fun getConfigProperty(path: String) =
        application.environment.config.property(path).getString()
}