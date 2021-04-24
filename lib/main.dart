/*
 * @Description: app入口
 * @Author: iamsmiling
 * @Date: 2020-12-15 12:05:52
 * @LastEditTime: 2021-04-22 13:39:41
 */

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:get/get.dart';
import 'package:taoju5/app.dart';

import 'app_initializer.dart';

void main() {
  _main();
}

void _main() {
  if (GetPlatform.isWeb) {
    return _webmain();
  }
  return _appMain();
}

void _appMain() async {
  await AppInitializer.init();
  return FlutterBugly.postCatchedException(() {
    startApp();
  });
}

void startApp() {
  // DoKit.runApp(
  //     app: DoKitApp(TaojuwuApp()),
  //     // 是否在release包内使用，默认release包会禁用
  //     useInRelease: AppConfig.isDebug,
  //     releaseAction: () => {
  //           // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
  //         });
  runApp(TaojuwuApp());
}

void _webmain() {
  AppInitializer.init();
  startApp();
}
