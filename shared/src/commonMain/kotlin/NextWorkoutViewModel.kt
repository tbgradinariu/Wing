import com.rickclephas.kmp.nativecoroutines.NativeCoroutinesState
import com.rickclephas.kmp.observableviewmodel.ViewModel
import com.rickclephas.kmp.observableviewmodel.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.datetime.Clock
import kotlinx.datetime.Instant
import kotlinx.datetime.LocalDate
import kotlinx.datetime.TimeZone
import kotlinx.datetime.format
import kotlinx.datetime.format.MonthNames
import kotlinx.datetime.format.char
import kotlinx.datetime.toLocalDateTime

class NextWorkoutViewModel: ViewModel() {

    private val workoutFlow = MutableStateFlow<Workout?>(viewModelScope, null)

    @NativeCoroutinesState
    val workout = workoutFlow.asStateFlow()

    fun getNextWorkout() {
        val weightedSets = listOf(
            Set(10, 10.0f, WeightType.WEIGHTED),
            Set(10, 15.0f, WeightType.WEIGHTED),
            Set(8, 20.0f, WeightType.WEIGHTED),
            Set(8, 20.0f, WeightType.WEIGHTED)
        )
        val bodyweightSets = listOf(
            Set(10, 87.0f, WeightType.BODYWEIGHT),
            Set(10, 87.0f, WeightType.BODYWEIGHT),
            Set(8, 87.0f, WeightType.BODYWEIGHT),
            Set(8, 87.0f, WeightType.BODYWEIGHT)
        )
        val squats = Exercise("Squats", weightedSets)
        val pullups = Exercise("Pull-ups", bodyweightSets)
        val calfRaises = Exercise("Calf raises", weightedSets)
        val barbellRows = Exercise("Barbell rows", weightedSets)
        val now: Instant = Clock.System.now()
        val today: LocalDate = now.toLocalDateTime(TimeZone.currentSystemDefault()).date
        val customFormat = LocalDate.Format {
            monthName(MonthNames.ENGLISH_ABBREVIATED); char(' '); dayOfMonth(); chars(", "); year()
        }
        val name = today.format(customFormat)
        val workout = Workout(name, today, listOf(squats, pullups, calfRaises, barbellRows))
        workoutFlow.value = workout
    }
}