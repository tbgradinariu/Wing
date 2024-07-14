package com.tiberiu.wing.model.workoutplans

interface WorkoutPlanRepository {
    suspend fun getWorkoutPlansForUser(userId: Int): List<WorkoutPlan>
}