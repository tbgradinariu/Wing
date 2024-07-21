package com.tiberiu.wing.repository

import com.tiberiu.wing.model.User

interface UserRepository {
    suspend fun getAllUsers(): List<User>

    suspend fun findByEmail(email: String): User?

    suspend fun findById(id: Int): User?

    suspend fun addUser(user: User): Boolean
}