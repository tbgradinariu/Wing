package com.tiberiu.wing.repository

import com.tiberiu.wing.db.ExerciseTemplateToWorkoutTemplate
import com.tiberiu.wing.db.ExerciseTemplates
import com.tiberiu.wing.db.ExerciseTypes
import com.tiberiu.wing.db.MuscleGroups
import com.tiberiu.wing.db.WorkoutPlans
import com.tiberiu.wing.db.WorkoutTemplateToWorkoutPlan
import com.tiberiu.wing.db.WorkoutTemplates
import com.tiberiu.wing.db.Workouts
import com.tiberiu.wing.db.dbQuery
import com.tiberiu.wing.model.CreateWorkoutPlanRequest
import com.tiberiu.wing.model.CreateWorkoutTemplateRequest
import com.tiberiu.wing.model.ExerciseTemplate
import com.tiberiu.wing.model.WorkoutPlan
import kotlinx.datetime.Clock
import kotlinx.datetime.Instant
import kotlinx.datetime.LocalDate
import kotlinx.datetime.LocalDateTime
import kotlinx.datetime.TimeZone
import kotlinx.datetime.toJavaLocalDate
import kotlinx.datetime.toLocalDateTime
import org.jetbrains.exposed.sql.JoinType
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.alias
import org.jetbrains.exposed.sql.count
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.insertReturning

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
                    val startDate = it[WorkoutPlans.startDate]?.let { startDate ->
                        LocalDate(startDate.year, startDate.month, startDate.dayOfMonth)
                    }
                    val endDate = it[WorkoutPlans.endDate]?.let { endDate ->
                        LocalDate(endDate.year, endDate.month, endDate.dayOfMonth) }
                    WorkoutPlan(
                        id = it[WorkoutPlans.id],
                        name = it[WorkoutPlans.name],
                        startDate = startDate,
                        endDate = endDate,
                        totalDoneWorkouts = it[totalWorkouts].toInt()
                    )
                }
        }
    }

    override suspend fun createWorkoutTemplate(createWorkoutTemplateRequest: CreateWorkoutTemplateRequest): Boolean {
        return dbQuery {
            try {
                WorkoutTemplates.insertReturning(listOf(WorkoutTemplates.id)) {
                    it[userId] = createWorkoutTemplateRequest.userId
                }.map {
                    createWorkoutTemplateRequest.exercises.forEach { exerciseId ->
                        ExerciseTemplateToWorkoutTemplate.insert { exerciseTemplateTable ->
                            exerciseTemplateTable[exerciseTemplateId] = exerciseId.toInt()
                            exerciseTemplateTable[workoutTemplateId] = it[WorkoutTemplates.id]
                        }
                    }
                }
                return@dbQuery true
            } catch(ex: Exception) {
                println("Error creating workout template: ${ex.message}")
                return@dbQuery false
            }
        }
    }

    override suspend fun createWorkoutPlan(workoutPlan: CreateWorkoutPlanRequest): Boolean {
        return dbQuery {
            try {
                val currentMoment: Instant = Clock.System.now()
                val today: LocalDate = currentMoment.toLocalDateTime(TimeZone.UTC).date
                val workoutPlanStartDate = workoutPlan.startDate ?: today
                WorkoutPlans.insertReturning(listOf(WorkoutPlans.id)) {
                    it[userId] = workoutPlan.userId
                    it[name] = workoutPlan.name
                    it[startDate] = workoutPlanStartDate.toJavaLocalDate()
                    it[endDate] = workoutPlan.endDate?.toJavaLocalDate()
                }.map { createdWorkoutResultRow ->
                    workoutPlan.workoutTemplates.forEach { workoutTemplate ->
                        WorkoutTemplateToWorkoutPlan.insert {
                            it[workoutTemplateId] = workoutTemplate.workoutTemplateId
                            it[workoutPlanId] = createdWorkoutResultRow[WorkoutPlans.id]
                            it[dayOfWeek] = workoutTemplate.dayOfWeek
                        }
                    }
                }
                return@dbQuery true
            } catch (exception: Exception) {
                println("Error creating workout plan: ${exception.message}")
                return@dbQuery false
            }
        }
    }
}