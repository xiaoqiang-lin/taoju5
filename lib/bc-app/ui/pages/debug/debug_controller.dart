/*
 * @Description: 调试逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:42:09
 * @LastEditTime: 2021-02-19 13:36:40
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/config/app_config.dart';

import 'package:taoju5/config/app_env.dart';

class DebugController extends GetxController {
  AppEnv env = AppConfig.env;
  AppMode mode = AppConfig.mode;
  bool get isBEndApp => env == AppEnv.$b;

  bool get isDebug => mode == AppMode.debug;

  String get appName => getAppName(env: env, mode: mode);
  String get baseUrl => getServerHost(env: env, mode: mode);

  ///切换app环境 是b端还是c端
  void switchEnv(bool isBEnd) {
    env = isBEnd ? AppEnv.$b : AppEnv.$c;
    update();
  }

  ///切换app调试环境 是测试服还是正式服
  void switchMode(bool isDebug) {
    mode = isDebug ? AppMode.debug : AppMode.release;
    update();
  }

  void save(BuildContext context) {
    Get.back();
    AppConfig.setEnv(appEnv: env, appMode: mode);
  }
}
