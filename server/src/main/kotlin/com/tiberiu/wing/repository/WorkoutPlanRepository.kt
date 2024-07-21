package com.tiberiu.wing.repository

import com.tiberiu.wing.model.WorkoutPlan

interface WorkoutPlanRepository {
    suspend fun getWorkoutPlansForUser(userId: Int): List<WorkoutPlan>
}