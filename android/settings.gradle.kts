pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use {
            properties.load(it)
        }

        val flutterSdkPath = properties.getProperty("flutter.sdk")

        require(flutterSdkPath != null) {
            "flutter.sdk not set in local.properties"
        }

        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"

    // Keep your existing compatible AGP version here.
    id("com.android.application") version "9.0.1" apply false

    // Keep your existing Kotlin version here.
    id("org.jetbrains.kotlin.android") version "YOUR_EXISTING_KOTLIN_VERSION" apply false
}

include(":app")
