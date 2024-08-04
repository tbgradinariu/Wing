package com.tiberiu.wing.model

import kotlinx.serialization.Serializable

@Serializable
data class ExerciseTemplate(
    val id: Int,
    val name: String,
    val muscleGroups: List<MuscleGroup>
)
