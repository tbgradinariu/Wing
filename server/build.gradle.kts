plugins {
    alias(libs.plugins.kotlinJvm)
    alias(libs.plugins.ktor)
    alias(libs.plugins.kotlinSerialization)
    application
}

group = "com.tiberiu.wing"
version = "1.0.0"

application {
    mainClass.set("com.tiberiu.wing.ApplicationKt")
    applicationDefaultJvmArgs = listOf("-Dio.ktor.development=${extra["io.ktor.development"] ?: "false"}")
}

dependencies {
    implementation(projects.shared)
    implementation(libs.logback)
    implementation(libs.ktor.server.config.yaml)
    implementation(libs.ktor.server.core)
    implementation(libs.ktor.server.netty)
    implementation(libs.ktor.server.statuspages)
    implementation(libs.ktor.server.contentnegotiation)
    implementation(libs.ktor.kotlinx.serialization)
    testImplementation(libs.ktor.server.tests)
    testImplementation(libs.kotlin.test.junit)
    testImplementation(libs.ktor.client.contentnegotiation)

    implementation(libs.exposed.core)
    implementation(libs.exposed.crypt)
    implementation(libs.exposed.dao)
    implementation(libs.exposed.jdbc)
    implementation(libs.exposed.jodatime)
    implementation(libs.exposed.javatime)
    implementation(libs.exposed.kotlindatetime)
    implementation(libs.exposed.json)
    implementation(libs.exposed.money)
    implementation(libs.exposed.sprintbootstarter)

    implementation(libs.postgressql)
}