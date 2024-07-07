package com.tiberiu.wing.db

import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.Transaction
import org.jetbrains.exposed.sql.javatime.date
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction

object Users: Table() {
    val id = integer("id").autoIncrement()
    val name = varchar("name", length = 50)
    val email = varchar("email", length = 50)
    val date = date("date_of_birth")

    override val primaryKey: PrimaryKey?
        get() = PrimaryKey(id)
}

suspend fun <T> dbQuery(block: Transaction.() -> T): T =
    newSuspendedTransaction(Dispatchers.IO, statement = block)