package com.tiberiu.wing.model.exercises

import kotlinx.serialization.Serializable

@Serializable
data class Exercise(
    val id: Int,
    val sets: List<ExerciseSet>
)
