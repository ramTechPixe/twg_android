# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.PaymentsClient
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.Wallet
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.WalletUtils
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers

# Keep Razorpay-related classes
-keep class com.razorpay.** { *; }

# Keep Proguard annotation classes
-keep @interface proguard.annotation.Keep
-keep @interface proguard.annotation.KeepClassMembers

# Keep class members annotated with @Keep
-keepclassmembers class * {
    @proguard.annotation.Keep *;
}
