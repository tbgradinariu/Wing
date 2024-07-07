package com.tiberiu.wing.model

import kotlinx.datetime.LocalDate
import kotlinx.serialization.Serializable

@Serializable
data class User(
    val name: String,
    val email: String,
    val dateOfBirth: LocalDate
)
