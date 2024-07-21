package com.tiberiu.wing.routing.request

import kotlinx.serialization.Serializable

@Serializable
data class UserRequest(
    val email: String,
    val password: String
)
