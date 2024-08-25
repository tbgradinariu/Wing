package com.tiberiu.wing

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform