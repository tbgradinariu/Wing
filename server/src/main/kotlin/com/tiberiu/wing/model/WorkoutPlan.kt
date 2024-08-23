package com.tiberiu.wing.model

import kotlinx.datetime.LocalDate
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class WorkoutPlan(
    val id: Int,
    val name: String,
    val startDate: LocalDate?,
    val endDate: LocalDate?,
    val totalDoneWorkouts: Int,
)

data class WorkoutPlanDetails(
    val name: String,
    val startDate: LocalDate,
    val endDate: LocalDate?,
    val workouts: List<Workout>
)

@Serializable
data class CreateWorkoutPlanRequest(
    @SerialName("user_id")
    val userId: Int,
    val name: String,
    @SerialName("start_date")
    val startDate: LocalDate? = null,
    @SerialName("end_date")
    val endDate: LocalDate? = null,
    @SerialName("workout_templates")
    val workoutTemplates: List<WorkoutTemplatePerDayRequest>
)

@Serializable
data class WorkoutTemplatePerDayRequest(
    @SerialName("day_of_week")
    val dayOfWeek: Int,
    @SerialName("workout_template_id")
    val workoutTemplateId: Int
)
