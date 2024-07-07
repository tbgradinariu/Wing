import io.ktor.server.application.Application
import io.ktor.server.config.ApplicationConfig
import org.jetbrains.exposed.sql.Database

fun Application.configureDatabases(config: ApplicationConfig) {
    val url = config.property("storage.jdbcURL").getString()
    val user = config.property("storage.user").getString()
    val password = config.property("storage.password").getString()

    Database.connect(
        url,
        user = user,
        password = password
    )
}