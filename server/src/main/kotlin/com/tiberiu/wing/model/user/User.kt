package com.tiberiu.wing.model.user

import kotlinx.datetime.LocalDate
import kotlinx.serialization.Serializable

@Serializable
data class User(
    val name: String,
    val email: String,
    val dateOfBirth: LocalDate
)
