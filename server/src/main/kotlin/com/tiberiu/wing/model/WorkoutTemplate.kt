package com.tiberiu.wing.model

import kotlinx.serialization.Serializable

@Serializable
data class WorkoutTemplate(
    val id: Int,
    val exerciseTemplates: List<ExerciseTemplate>
)
