package com.tiberiu.wing.repository

import com.tiberiu.wing.model.CreateWorkoutPlanRequest
import com.tiberiu.wing.model.CreateWorkoutTemplateRequest
import com.tiberiu.wing.model.ExerciseTemplate
import com.tiberiu.wing.model.WorkoutPlan
import com.tiberiu.wing.model.WorkoutPlanDetails
import com.tiberiu.wing.model.WorkoutTemplate

interface WorkoutPlanRepository {
    suspend fun getExerciseTemplates(): List<ExerciseTemplate>
    suspend fun getWorkoutPlansForUser(userId: Int): List<WorkoutPlan>
    suspend fun createWorkoutTemplate(createWorkoutTemplateRequest: CreateWorkoutTemplateRequest): Boolean
    suspend fun createWorkoutPlan(workoutPlan: CreateWorkoutPlanRequest): Boolean
}