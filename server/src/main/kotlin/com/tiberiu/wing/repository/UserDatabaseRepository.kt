package com.tiberiu.wing.repository

import com.tiberiu.wing.db.Users
import com.tiberiu.wing.db.dbQuery
import com.tiberiu.wing.model.User
import kotlinx.datetime.LocalDate
import kotlinx.datetime.toJavaLocalDate
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.insertIgnore
import org.jetbrains.exposed.sql.selectAll
import org.jetbrains.exposed.sql.transactions.transaction
import java.security.MessageDigest
import java.security.SecureRandom
import javax.crypto.SecretKeyFactory
import javax.crypto.spec.PBEKeySpec

class UserDatabaseRepository: UserRepository {

    init {
        transaction {
            SchemaUtils.create(Users)
        }
    }
    override suspend fun getAllUsers(): List<User> {
        return dbQuery {
            Users.selectAll()
                .map {
                    val dob = LocalDate(it[Users.dateOfBirth].year, it[Users.dateOfBirth].month, it[Users.dateOfBirth].dayOfMonth)
                    User(
                        id = it[Users.id],
                        name = it[Users.name],
                        email = it[Users.email],
                        passwordHash = it[Users.passwordHash],
                        dateOfBirth = dob
                    )
                }
        }
    }

    override suspend fun findByEmail(email: String): User? {
        return dbQuery {
            Users.selectAll()
                .where { Users.email eq email }
                .map {
                    val dob = LocalDate(
                        it[Users.dateOfBirth].year,
                        it[Users.dateOfBirth].month,
                        it[Users.dateOfBirth].dayOfMonth
                    )
                    User(
                        id = it[Users.id],
                        name = it[Users.name],
                        email = it[Users.email],
                        passwordHash = it[Users.passwordHash],
                        dateOfBirth = dob
                    )
                }
                .singleOrNull()
        }
    }

    override suspend fun findById(id: Int): User? {
        return dbQuery {
            Users.selectAll()
                .where { Users.id eq id }
                .map {
                    val dob = LocalDate(
                        it[Users.dateOfBirth].year,
                        it[Users.dateOfBirth].month,
                        it[Users.dateOfBirth].dayOfMonth
                    )
                    User(
                        id = it[Users.id],
                        name = it[Users.name],
                        email = it[Users.email],
                        passwordHash = it[Users.passwordHash],
                        dateOfBirth = dob
                    )
                }
                .singleOrNull()
        }
    }

    override suspend fun addUser(user: User): Boolean {
        return dbQuery {
            try {
                Users.insert {
                    it[name] = user.name
                    it[email] = user.email
                    it[passwordHash] = user.passwordHash
                    it[dateOfBirth] = user.dateOfBirth.toJavaLocalDate()
                }
                return@dbQuery true
            } catch(ex: Exception) {
                return@dbQuery false
            }

        }
    }
}

@OptIn(ExperimentalStdlibApi::class)
fun String.sha256Hash(): String {
    val sha256 = MessageDigest.getInstance("SHA256")
    val digest = sha256.digest(this.toByteArray())
    return digest.toHexString()
}

private const val SECRET = "KaleoNoGood"
private const val ALGORITHM = "PBKDF2WithHmacSHA512"
private const val ITERATIONS = 120_000
private const val KEY_LENGTH = 256


@OptIn(ExperimentalStdlibApi::class)
fun generateHash(password: String, salt: String): String {
    val combinedSalt = "$salt$SECRET".toByteArray()

    val factory = SecretKeyFactory.getInstance(ALGORITHM)
    val spec = PBEKeySpec(password.toCharArray(), combinedSalt, ITERATIONS, KEY_LENGTH)
    val key = factory.generateSecret(spec)
    val hash = key.encoded
    return hash.toHexString()
}