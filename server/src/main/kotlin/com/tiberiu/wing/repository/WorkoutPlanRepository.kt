package com.tiberiu.wing.repository

import com.tiberiu.wing.model.WorkoutPlan
import com.tiberiu.wing.model.WorkoutPlanDetails

interface WorkoutPlanRepository {
    suspend fun getWorkoutPlansForUser(userId: Int): List<WorkoutPlan>
}