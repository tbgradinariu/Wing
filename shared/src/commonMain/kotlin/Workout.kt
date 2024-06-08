import kotlinx.datetime.LocalDate

data class Workout(
    val name: String,
    val date: LocalDate,
    val exercises: List<Exercise>
)

data class Exercise(
    val name: String,
    val sets: List<Set>
)
enum class WeightType() {
    BODYWEIGHT,
    WEIGHTED
}

data class Set(val reps: Int, val weight: Float, val weightType: WeightType)
