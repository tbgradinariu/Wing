package com.tiberiu.wing.service

import com.tiberiu.wing.model.CreateWorkoutPlanRequest
import com.tiberiu.wing.model.CreateWorkoutTemplateRequest
import com.tiberiu.wing.model.WorkoutTemplate
import com.tiberiu.wing.repository.WorkoutPlanRepository

class WorkoutService(
    private val repository: WorkoutPlanRepository
) {
    suspend fun getExerciseTemplates() =
        repository.getExerciseTemplates()

    suspend fun createWorkoutTemplate(workoutTemplateRequest: CreateWorkoutTemplateRequest): Boolean =
        repository.createWorkoutTemplate(workoutTemplateRequest)

    suspend fun createWorkoutPlan(workoutPlanRequest: CreateWorkoutPlanRequest): Boolean =
        repository.createWorkoutPlan(workoutPlanRequest)

    suspend fun getWorkoutPlansForUser(userId: Int) =
        repository.getWorkoutPlansForUser(userId)
}