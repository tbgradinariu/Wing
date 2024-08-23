package com.tiberiu.wing.model

import com.tiberiu.wing.db.ExerciseTemplates
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class WorkoutTemplate(
    val id: Int,
    val userId: Int,
    val exercises: List<ExerciseTemplate>
)

@Serializable
data class CreateWorkoutTemplateRequest(
    @SerialName("user_id")
    val userId: Int,
    @SerialName("exercise_id_list")
    val exercises: List<String>
)

fun WorkoutTemplate.toCreateWorkoutTemplateRequest() =
    CreateWorkoutTemplateRequest(
        userId = this.userId,
        exercises = this.exercises.map { it.id.toString() }
    )
