package com.tiberiu.wing.routing.response

import kotlinx.serialization.Serializable

@Serializable
data class UserResponse(
    val id: Int,
    val email: String
)
