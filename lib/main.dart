/*
 * @Description: app入口
 * @Author: iamsmiling
 * @Date: 2020-12-15 12:05:52
 * @LastEditTime: 2021-02-03 10:30:05
 */

import 'package:flutter/material.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:get/get.dart';
import 'package:taoju5/app.dart';
import 'bapp/app_initializer.dart';

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
  runApp(TaojuwuApp());
}

void _webmain() async {
  await AppInitializer.init();
  startApp();
}
