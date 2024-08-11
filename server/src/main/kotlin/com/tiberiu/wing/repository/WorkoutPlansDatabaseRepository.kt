package com.tiberiu.wing.repository

import com.tiberiu.wing.db.ExerciseSets
import com.tiberiu.wing.db.ExerciseTemplates
import com.tiberiu.wing.db.ExerciseTypes
import com.tiberiu.wing.db.Exercises
import com.tiberiu.wing.db.MuscleGroups
import com.tiberiu.wing.db.WorkoutPlans
import com.tiberiu.wing.db.Workouts
import com.tiberiu.wing.db.dbQuery
import com.tiberiu.wing.model.ExerciseTemplate
import com.tiberiu.wing.model.WorkoutPlan
import com.tiberiu.wing.model.WorkoutPlanDetails
import kotlinx.datetime.LocalDate
import org.jetbrains.exposed.sql.JoinType
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.alias
import org.jetbrains.exposed.sql.count

class WorkoutPlansDatabaseRepository: WorkoutPlanRepository {
    override suspend fun getExerciseTemplates(): List<ExerciseTemplate> {
        return dbQuery {
            val m1 = MuscleGroups.alias("m1")
            val m2 = MuscleGroups.alias("m2")
            val m3 = MuscleGroups.alias("m3")
            val m4 = MuscleGroups.alias("m4")
            val m5 = MuscleGroups.alias("m5")
            val exerciseType = ExerciseTypes.name.alias("exercise_type")
            val mainMuscleGroup = m1[MuscleGroups.name].alias("main_muscle_group")
            val secondaryMuscleGroup = m2[MuscleGroups.name].alias("secondary_muscle_group")
            val thirdMuscleGroup = m3[MuscleGroups.name].alias("third_muscle_group")
            val fourthMuscleGroup = m4[MuscleGroups.name].alias("fourth_muscle_group")
            val fifthMuscleGroup = m5[MuscleGroups.name].alias("fifth_muscle_group")
            ExerciseTemplates
                .join(ExerciseTypes, JoinType.LEFT, ExerciseTemplates.exerciseTypeId, ExerciseTypes.id)
                .join(m1, JoinType.LEFT, ExerciseTemplates.mainMuscleGroupId, m1[MuscleGroups.id])
                .join(m2, JoinType.LEFT, ExerciseTemplates.secondaryMuscleGroupId, m2[MuscleGroups.id])
                .join(m3, JoinType.LEFT, ExerciseTemplates.thirdMuscleGroupId, m3[MuscleGroups.id])
                .join(m4, JoinType.LEFT, ExerciseTemplates.fourthMuscleGroupId, m4[MuscleGroups.id])
                .join(m5, JoinType.LEFT, ExerciseTemplates.fifthMuscleGroupId, m5[MuscleGroups.id])
                .select(
                    ExerciseTemplates.id,
                    ExerciseTemplates.name,
                    exerciseType,
                    mainMuscleGroup,
                    secondaryMuscleGroup,
                    thirdMuscleGroup,
                    fourthMuscleGroup,
                    fifthMuscleGroup
                )
                .map {
                    ExerciseTemplate(
                        id = it[ExerciseTemplates.id],
                        name = it[ExerciseTemplates.name],
                        exerciseType = it[exerciseType],
                        mainMuscleGroup = it[mainMuscleGroup],
                        secondaryMuscleGroup = it[secondaryMuscleGroup],
                        thirdMuscleGroup = it[thirdMuscleGroup],
                        fourthMuscleGroup = it[fourthMuscleGroup],
                        fifthMuscleGroup = it[fifthMuscleGroup]
                    )
                }
        }
    }

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
                        targetWeeklyWorkoutDays = 0,
                        startDate = LocalDate(it[WorkoutPlans.startDate].year, it[WorkoutPlans.startDate].month, it[WorkoutPlans.startDate].dayOfMonth),
                        endDate = endDate,
                        totalDoneWorkouts = it[totalWorkouts].toInt()
                    )
                }
        }
    }
}