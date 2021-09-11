/*
 * @Description: //TODO
 * @Author: iamsmiling
 * @Date: 2021-09-11 09:43:20
 * @LastEditTime: 2021-09-11 12:32:38
 */
// package com.buyi.taojuwu;

// import com.tencent.tinker.loader.app.TinkerApplication;
// import com.tencent.tinker.loader.shareutil.ShareConstants;

// import io.flutter.view.FlutterMain;

// /**
//  * 自定义Application.
//  *
//  * 注意：这个类集成TinkerApplication类，这里面不做任何操作，所有Application的代码都会放到ApplicationLike继承类当中<br/>
//  * <pre>
//  * 参数解析：
//  * 参数1：int tinkerFlags 表示Tinker支持的类型 dex only、library only or all suuport，default: TINKER_ENABLE_ALL
//  * 参数2：String delegateClassName Application代理类 这里填写你自定义的ApplicationLike
//  * 参数3：String loaderClassName  Tinker的加载器，使用默认即可
//  * 参数4：boolean tinkerLoadVerifyFlag  加载dex或者lib是否验证md5，默认为false
//  * </pre>
//  * @author wenjiewu
//  * @since 2016/11/15
//  */
// public class Taoju5Application extends TinkerApplication {
//     public Taoju5Application() {
//         super(ShareConstants.TINKER_ENABLE_ALL, "com.buyi.taojuwu.Taoju5ApplicationLike",
                
//                 "com.tencent.tinker.loader.TinkerLoader", false, true);
//     }

//     @Override
//     public void onCreate() {
//         super.onCreate();
//         FlutterMain.startInitialization(this);
//     }
// }
