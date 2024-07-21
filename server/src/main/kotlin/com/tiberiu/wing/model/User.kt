package com.tiberiu.wing.model

import kotlinx.datetime.LocalDate
import kotlinx.datetime.toJavaLocalDate
import kotlinx.serialization.Serializable

@Serializable
data class User(
    val id: Int,
    val name: String,
    val email: String,
    val passwordHash: String,
    val dateOfBirth: LocalDate
)


