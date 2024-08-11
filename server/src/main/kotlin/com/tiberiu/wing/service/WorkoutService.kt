package com.tiberiu.wing.service

import com.tiberiu.wing.repository.WorkoutPlanRepository

class WorkoutService(
    private val repository: WorkoutPlanRepository
) {
    suspend fun getExerciseTemplates() =
        repository.getExerciseTemplates()
}