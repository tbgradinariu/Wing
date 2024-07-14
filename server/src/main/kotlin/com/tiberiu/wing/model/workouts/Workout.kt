package com.tiberiu.wing.model.workouts

import com.tiberiu.wing.model.exercises.Exercise
import kotlinx.datetime.LocalDate
import kotlinx.serialization.Serializable

@Serializable
data class Workout(
    val id: Int,
    val name: String,
    val date: LocalDate,
    val exercises: List<Exercise>
)
