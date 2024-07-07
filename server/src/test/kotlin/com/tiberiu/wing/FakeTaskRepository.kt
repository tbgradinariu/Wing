import com.tiberiu.wing.model.Priority
import com.tiberiu.wing.model.Task
import com.tiberiu.wing.model.TaskRepository

class FakeTaskRepository: TaskRepository {
    private val tasks = mutableListOf(
        Task("cleaning", "Clean the house", Priority.Low),
        Task("gardening", "Mow the lawn", Priority.Medium),
        Task("shopping", "Buy the groceries", Priority.High),
        Task("painting", "Paint the fence", Priority.Medium)
    )

    override suspend fun allTasks(): List<Task> = tasks

    override suspend fun tasksByPriority(priority: Priority) = tasks.filter {
        it.priority == priority
    }

    override suspend fun taskByName(name: String) = tasks.find {
        it.name.equals(name, ignoreCase = true)
    }

    override suspend fun addTask(task: Task) {
        if (taskByName(task.name) != null) {
            throw IllegalStateException("Cannot duplicate task with name: ${task.name}")
        }
        tasks.add(task)
    }

    override suspend fun removeTask(taskName: String): Boolean {
        return tasks.removeIf { it.name == taskName }
    }
}