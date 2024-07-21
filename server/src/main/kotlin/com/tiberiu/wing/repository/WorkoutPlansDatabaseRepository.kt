package com.tiberiu.wing.repository

import com.tiberiu.wing.db.WorkoutPlans
import com.tiberiu.wing.db.Workouts
import com.tiberiu.wing.db.dbQuery
import com.tiberiu.wing.model.WorkoutPlan
import kotlinx.datetime.LocalDate
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.alias
import org.jetbrains.exposed.sql.count

class WorkoutPlansDatabaseRepository: WorkoutPlanRepository {
    override suspend fun getWorkoutPlansForUser(userId: Int): List<WorkoutPlan> {
        return dbQuery {
            val totalWorkouts = Workouts.workoutPlanId.count().alias("total_workouts")
            WorkoutPlans.
                leftJoin(Workouts)
                .select(
                    WorkoutPlans.id,
                    WorkoutPlans.userId,
                    WorkoutPlans.name,
                    WorkoutPlans.startDate,
                    WorkoutPlans.endDate,
                    WorkoutPlans.targetWeeklyWorkoutDays,
                    totalWorkouts)
                .where(WorkoutPlans.userId eq userId)
                .groupBy(WorkoutPlans.id)
                .map {
                    var endDate: LocalDate? = null
                    if (it.getOrNull(WorkoutPlans.endDate) != null) {
                        endDate = LocalDate(it[WorkoutPlans.endDate].year, it[WorkoutPlans.endDate].month, it[WorkoutPlans.endDate].dayOfMonth)
                    }
                    WorkoutPlan(
                        id = it[WorkoutPlans.id],
                        name = it[WorkoutPlans.name],
                        targetWeeklyWorkoutDays = it[WorkoutPlans.targetWeeklyWorkoutDays],
                        startDate = LocalDate(it[WorkoutPlans.startDate].year, it[WorkoutPlans.startDate].month, it[WorkoutPlans.startDate].dayOfMonth),
                        endDate = endDate,
                        totalDoneWorkouts = it[totalWorkouts].toInt()
                        )
                }
        }
    }
}