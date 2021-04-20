/*
 * @Description: App相关配置
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:20:38
 * @LastEditTime: 2021-04-20 15:40:03
 */

import 'package:flutter/foundation.dart';
import 'package:taoju5/config/app_env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  // app名字
  // static String get appName => isDebug ? '淘居屋商家测试版' : "淘居屋商家";
  static AppEnv env = AppEnv.$b;

  ///打包时只需要修改这两个即可
  static AppMode mode = AppMode.debug;

  static String get appName => getAppName(env: env, mode: mode);

  static String get baseUrl => getServerHost(env: env, mode: mode);

  static const String imagePrefix = "assets/images/";

  /// bugly相关
  static const buglyAndroidAppId = '0da7f235c9';
  static const buglyIosAppId = '9e3d92e673';

  ///高德地图key
  static const String amapAndroidKey = "8e7fdd6ce80879a122c2768ebed08f03";

  /// 微信分享相关
  static const weChatAppId = 'wx1dda23b1cd57b8c2';
  static const weCharShareUniversalLink = 'https://ii1vy.share2dlink.com/';

  static bool get isDebug => mode == AppMode.debug;
  static bool get isPro => bool.fromEnvironment('dart.vm.product');

  static bool get isBEndApp => env == AppEnv.$b;

  static bool get isCEndApp => env == AppEnv.$c;

  static Future syncConfig() {
    return SharedPreferences.getInstance().then((SharedPreferences sp) {
      AppConfig.mode =
          (sp.getBool("isDebug") ?? isDebug) ? AppMode.debug : AppMode.release;
      AppConfig.env =
          (sp.getBool("isBEnd") ?? isBEndApp) ? AppEnv.$b : AppEnv.$c;
    });
  }

  static void setEnv({@required AppEnv appEnv, @required AppMode appMode}) {
    AppConfig.env = appEnv;
    AppConfig.mode = appMode;
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sp.setBool("isDebug", env == AppEnv.$b);
      sp.setBool("isBEnd", mode == AppMode.debug);
    });
  }
}
