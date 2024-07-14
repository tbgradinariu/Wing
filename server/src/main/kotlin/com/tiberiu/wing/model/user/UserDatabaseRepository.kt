package com.tiberiu.wing.model.user

import com.tiberiu.wing.db.Users
import com.tiberiu.wing.db.dbQuery
import kotlinx.datetime.LocalDate
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.selectAll
import org.jetbrains.exposed.sql.transactions.transaction

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
                    val dob = LocalDate(it[Users.date].year, it[Users.date].month, it[Users.date].dayOfMonth)
                    User(name = it[Users.name], email = it[Users.email], dateOfBirth = dob)
                }
        }
    }

    override suspend fun getUserByEmail(email: String): User? {
        return dbQuery {
            Users.selectAll()
                .where { Users.email eq email }
                .map {
                    val dob = LocalDate(
                        it[Users.date].year,
                        it[Users.date].month,
                        it[Users.date].dayOfMonth
                    )
                    User(name = it[Users.name], email = it[Users.email], dateOfBirth = dob)
                }
                .singleOrNull()
        }
    }
}