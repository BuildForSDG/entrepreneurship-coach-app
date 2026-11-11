import java.util.Properties

pluginManagement {
    val properties = Properties()
    val localProperties = file("local.properties")
    if (!localProperties.exists()) {
        throw GradleException("android/local.properties is missing. Run Flutter tooling or set flutter.sdk and sdk.dir.")
    }

    // Read local.properties using Kotlin's inputStream extension
    localProperties.inputStream().use { properties.load(it) }

    val flutterSdkPath = properties.getProperty("flutter.sdk")
    if (flutterSdkPath.isNullOrBlank()) {
        throw GradleException("flutter.sdk is missing from android/local.properties")
    }

    val flutterGradleBuild = file("$flutterSdkPath/packages/flutter_tools/gradle")
    if (!flutterGradleBuild.isDirectory) {
        throw GradleException("Flutter Gradle plugin not found at $flutterGradleBuild. Correct flutter.sdk or reinstall Flutter.")
    }

    includeBuild(flutterGradleBuild)

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
    id("com.google.gms.google-services") version "4.4.2" apply false
}

include(":app")
