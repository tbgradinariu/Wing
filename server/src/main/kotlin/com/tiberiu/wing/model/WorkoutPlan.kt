package com.tiberiu.wing.model

import kotlinx.datetime.LocalDate
import kotlinx.serialization.Serializable

@Serializable
data class WorkoutPlan(
    val id: Int,
    val name: String,
    val targetWeeklyWorkoutDays: Int,
    val startDate: LocalDate,
    val endDate: LocalDate?,
    val totalDoneWorkouts: Int
)
