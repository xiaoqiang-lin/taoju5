/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:54:58
 * @LastEditTime: 2021-02-19 13:56:43
 */
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/home/home_page.dart';
import 'package:taoju5/config/app_config.dart';

import 'package:taoju5/config/app_env.dart';

import 'routes/capp_pages.dart';

class $CAPP extends StatelessWidget {
  const $CAPP({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: ValueKey(AppEnv.$c),
      title: AppConfig.appName,
      getPages: CAppPages.pages,
      home: CHomePage(),
      defaultTransition: Get.defaultTransition,
      popGesture: false,
      // defaultTransition: Transition,

      localizationsDelegates: [
        // CupertinoLocalizationDelegate.delegate,
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
      ],
      supportedLocales: [Locale("en"), Locale("zh")],
      navigatorKey: Get.key,
    );
  }
}
