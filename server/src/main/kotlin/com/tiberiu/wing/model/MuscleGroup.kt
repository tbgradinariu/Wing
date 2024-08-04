package com.tiberiu.wing.model

import kotlinx.serialization.Serializable

@Serializable
data class MuscleGroup(
    val id: Int,
    val name: String
)
