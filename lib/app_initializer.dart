/*
 * @Description: APP初始化配置
 * @Author: iamsmiling
 * @Date: 2021-01-12 22:34:48
 * @LastEditTime: 2021-04-17 18:11:29
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_bc/config/app_manager.dart';
import 'package:taoju5_bc/config/sdk_manager/sdk_manager.dart';
import 'package:taoju5_bc/storage/storage_manager.dart';

import 'package:taoju5_b/res/b_icons.dart';

abstract class AppInitializer {
  static init() {
    if (GetPlatform.isWeb) {
      return _initWeb();
    }
    return _initApp();
  }

  static void _initWeb() {
    _initEasyloading();
    _initWidgetBinding();
    _initStorage();
    _initAppConfig();
  }

  static void _initApp() async {
    await _initWidgetBinding();
    await _initStorage();
    await _initSDK();

    await _initAppConfig();
    _initSystemUI();
    _initEasyloading();
  }

  static void _initEasyloading() {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;

    // EasyLoading.instance.errorWidget = Container(
    //   width: 64,
    //   height: 64,
    //   color: Colors.transparent,
    //   child: FlareActor("assets/flrs/fail.flr",
    //       alignment: Alignment.center,
    //       color: Colors.white,
    //       fit: BoxFit.contain,
    //       animation: "idle"),
    // );
    EasyLoading.instance.infoWidget =
        Icon(BIcons.exclamation_point, color: Colors.white, size: 48);
    EasyLoading.instance.animationDuration = const Duration(milliseconds: 375);
    EasyLoading.instance.displayDuration = const Duration(milliseconds: 375);
  }

  static Future _initSDK() async {
    SdkManager().init();
  }

  static Future _initStorage() async {
    await StorageManager().init();
  }

  static Future _initAppConfig() async {
    await AppConfig.syncConfig();
    await AppManager.getAppInfo();
  }

  static Future _initWidgetBinding() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static void _initSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
  }
}
