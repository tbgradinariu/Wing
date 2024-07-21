package com.tiberiu.wing.service

import com.tiberiu.wing.model.User
import com.tiberiu.wing.repository.UserRepository

class UserService(
    private val userRepository: UserRepository
) {

    suspend fun getAllUsers(): List<User> =
        userRepository.getAllUsers()

    suspend fun findByEmail(email: String): User? =
        userRepository.findByEmail(email)

    suspend fun findById(id: Int): User? =
        userRepository.findById(id)

    suspend fun addUser(user: User): User? {
        val foundUser = findByEmail(user.email)
        return if (foundUser == null && userRepository.addUser(user)) {
            user
        } else null
    }
}