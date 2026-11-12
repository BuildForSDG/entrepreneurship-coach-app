
import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

require(keystorePropertiesFile.exists()) {
    "Missing android/key.properties. Check your GitHub signing setup."
}

FileInputStream(keystorePropertiesFile).use {
    keystoreProperties.load(it)
}

android {
    namespace = "com.gladstargtschool6.investlearn"

    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
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
            signingConfig =
                signingConfigs.getByName("release")

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

flutter {
    source = "../.."
}
