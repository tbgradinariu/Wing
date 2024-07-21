package com.tiberiu.wing.db

import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.SqlExpressionBuilder.isNotNull
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.Transaction
import org.jetbrains.exposed.sql.javatime.date
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction

object Users: Table() {
    val id = integer("id").autoIncrement("users_id_seq")
    val name = varchar("name", 50)
    val email = varchar("email", 50)
    val passwordHash = varchar("password_hash", 100)
    val dateOfBirth = date("date_of_birth")

    override val primaryKey: PrimaryKey?
        get() = PrimaryKey(id)
}

object ExerciseSets: Table("exercise_sets") {
    val id = integer("id").autoIncrement("exercise_sets_id_seq")
    val exerciseId = integer("exercise_id").references(Exercises.id)
    val reps = integer("reps")
    val weight = integer("additionalWeight")
    val isPerformedToFailure = bool("isPerformedToFailure")

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

object ExerciseTypes: Table("exercise_types") {
    val id = integer("id").autoIncrement("exercise_types_id_seq")
    val name = varchar("name", 20)

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

object MuscleGroups: Table("muscle_groups") {
    val id = integer("id").autoIncrement("muscle_groups_id_seq")
    val name = varchar("name", 40)

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

object ExerciseTemplates: Table("exercise_templates") {
    val id = integer("id").autoIncrement("exercise_templates_id_seq")
    val exerciseTypeId = integer("exercise_type_id").references(ExerciseTypes.id)
    val name = varchar("name", 40)
    val mainMuscleGroupId = integer("muscle_group_id").references(MuscleGroups.id)
    val secondaryMuscleGroupId = integer("secondary_muscle_group_id").references(MuscleGroups.id)
    val thirdMuscleGroupId = integer("third_muscle_group_id").references(MuscleGroups.id)
    val fourthMuscleGroupId = integer("fourth_muscle_group_id").references(MuscleGroups.id)
    val fifthMuscleGroupId = integer("fifth_muscle_group_id").references(MuscleGroups.id)

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

object Exercises: Table("exercises") {
    val id = integer("id").autoIncrement("exercises_id_seq")
    val exerciseTemplateId = integer("exercise_template_id").references(ExerciseTemplates.id)
    val workoutId = integer("workout_id").references(Workouts.id)

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

object Workouts: Table("workouts") {
    val id = integer("id").autoIncrement("workouts_id_seq")
    val workoutPlanId = integer("workout_plan_id").references(WorkoutPlans.id)
    val userId = integer("user_id").references(Users.id)
    val name = varchar("name", 40)
    val date = date("date")

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

object WorkoutPlans: Table("workout_plans") {
    val id = integer("id").autoIncrement("workout_plans_id_seq")
    val userId = integer("user_id").references(Users.id)
    val name = varchar("name", 40)
    val targetWeeklyWorkoutDays = integer("target_weekly_workout_days")
    val startDate = date("start_date")
    val endDate = date("end_date")

    override val primaryKey: PrimaryKey
        get() = PrimaryKey(id)
}

suspend fun <T> dbQuery(block: Transaction.() -> T): T =
    newSuspendedTransaction(Dispatchers.IO, statement = block)