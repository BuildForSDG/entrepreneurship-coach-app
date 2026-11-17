
# ==========================================
# GLADSTAR GT SCHOOL - R8 OPTIMIZATION
# ==========================================

# Preserve annotation and generic signature metadata
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# Preserve Flutter plugin registration
-keep class io.flutter.plugins.GeneratedPluginRegistrant {
    *;
}

# Preserve Firebase service components when required
-keep class * extends com.google.firebase.messaging.FirebaseMessagingService {
    *;
}

# Preserve Firebase components instantiated through reflection
-keepclassmembers class * {
    @com.google.firebase.database.PropertyName <methods>;
}

# Preserve Gson serialized fields when Gson is used
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Preserve Parcelable CREATOR fields
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator CREATOR;
}

# Remove debug logging in release builds
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
}

# Allow R8 optimization
-allowaccessmodification
