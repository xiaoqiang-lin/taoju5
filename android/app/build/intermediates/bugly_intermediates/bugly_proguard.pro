#Bugly proguard config here
-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}
#Avoid affect upgrade function, need to keep the support package of classes
-keep class android.support.**{*;}
