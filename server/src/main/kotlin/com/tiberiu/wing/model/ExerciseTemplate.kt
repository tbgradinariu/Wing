package com.tiberiu.wing.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class ExerciseTemplate(
    val id: Int,
    val name: String,
    @SerialName("exercise_type")
    val exerciseType: String,
    @SerialName("main_muscle_group")
    val mainMuscleGroup: String,
    @SerialName("secondary_muscle_group")
    val secondaryMuscleGroup: String?,
    @SerialName("third_muscle_group")
    val thirdMuscleGroup: String?,
    @SerialName("fourth_muscle_group")
    val fourthMuscleGroup: String?,
    @SerialName("fifth_muscle_group")
    val fifthMuscleGroup: String?
)
