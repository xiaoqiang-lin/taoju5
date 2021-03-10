-applymapping /Users/knight/WorkingSpace/asFlutter/flutter_tinker/build/app/bakApk/app-0114-14-12-58/app-release-mapping.txt
-keepattributes *Annotation* 
-dontwarn com.tencent.tinker.anno.AnnotationProcessor 
-keep @com.tencent.tinker.anno.DefaultLifeCycle public class *
-keep public class * extends android.app.Application {
    *;
}
-keep public class com.tencent.tinker.entry.ApplicationLifeCycle {
    *;
}
-keep public class * implements com.tencent.tinker.entry.ApplicationLifeCycle {
    *;
}
-keep public class com.tencent.tinker.loader.TinkerLoader {
    *;
}
-keep public class * extends com.tencent.tinker.loader.TinkerLoader {
    *;
}
-keep public class com.tencent.tinker.loader.TinkerTestDexLoad {
    *;
}
-keep public class com.tencent.tinker.entry.TinkerApplicationInlineFence {
    *;
}
#your dex.loader patterns here
-keep class com.tencent.tinker.loader.**
-keep class com.buyi.taojuwu.Taoju5Application
