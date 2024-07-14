package com.tiberiu.wing.model.exercises

import kotlinx.serialization.Serializable

@Serializable
data class ExerciseSet(
    val id: Int,
    val repCount: Int,
    val additionalWeight: Int,
    val isPerformedToFailure: Boolean
)
