package com.tiberiu.wing.model

interface UserRepository {
    suspend fun getAllUsers(): List<User>

    suspend fun getUserByEmail(email: String): User?
}