pluginManagement {
    def properties = new Properties()
    def localProperties = file("local.properties")
    if (!localProperties.exists()) {
        throw new GradleException("android/local.properties is missing. Run Flutter tooling or set flutter.sdk and sdk.dir.")
    }
    localProperties.withInputStream { properties.load(it) }
    def flutterSdkPath = properties.getProperty("flutter.sdk")
    if (flutterSdkPath == null || flutterSdkPath.trim().isEmpty()) {
        throw new GradleException("flutter.sdk is missing from android/local.properties")
    }
    def flutterGradleBuild = file("${flutterSdkPath}/packages/flutter_tools/gradle")
    if (!flutterGradleBuild.isDirectory()) {
        throw new GradleException("Flutter Gradle plugin not found at ${flutterGradleBuild}. Correct flutter.sdk or reinstall Flutter.")
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
