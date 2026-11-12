
pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        val localPropertiesFile = file("local.properties")

        require(localPropertiesFile.exists()) {
            "android/local.properties is missing. Run flutter pub get first."
        }

        localPropertiesFile.inputStream().use {
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

    id("com.android.application") version "8.13.0" apply false

    id("org.jetbrains.kotlin.android") version "2.3.20" apply false

    id("com.google.gms.google-services") version "4.5.0" apply false
}

include(":app")
