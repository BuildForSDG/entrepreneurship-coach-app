
import java.util.Properties
import java.io.FileInputStream

import com.android.build.api.dsl.ApplicationExtension
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// Load Android signing properties
val keystoreProperties = Properties()

val keystorePropertiesFile = rootProject.file("key.properties")

require(keystorePropertiesFile.exists()) {
    "Missing android/key.properties. Check your GitHub signing setup."
}

FileInputStream(keystorePropertiesFile).use {
    keystoreProperties.load(it)
}

// Configure Android using the AGP 9 ApplicationExtension API
extensions.configure<ApplicationExtension> {

    namespace = "com.gladstargtschool6.investlearn"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.gladstargtschool6.investlearn"

        minSdk = 23
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            storeFile = file(
                keystoreProperties.getProperty("storeFile")
                    ?: error("Missing storeFile")
            )

            keyAlias =
                keystoreProperties.getProperty("keyAlias")
                    ?: error("Missing keyAlias")

            keyPassword =
                keystoreProperties.getProperty("keyPassword")
                    ?: error("Missing keyPassword")

            storePassword =
                keystoreProperties.getProperty("storePassword")
                    ?: error("Missing storePassword")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")

            isMinifyEnabled = true
            isShrinkResources = true

            proguardFiles(
                getDefaultProguardFile(
                    "proguard-android-optimize.txt"
                ),
                "proguard-rules.pro"
            )
        }
    }
}

// Configure Kotlin using the modern compilerOptions DSL
kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.JVM_17)
    }
}

// Flutter configuration
flutter {
    source = "../.."
}
