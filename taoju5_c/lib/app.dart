/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:54:58
 * @LastEditTime: 2021-04-18 15:15:08
 */
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_config.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_env.dart';

import 'package:taoju5_c/ui/pages/main/main_binding.dart';
import 'package:taoju5_c/ui/pages/main/main_page.dart';

import 'res/R.dart';
import 'routes/app_pages.dart';

class $CAPP extends StatelessWidget {
  const $CAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: ValueKey(AppEnv.$c),
      title: AppConfig.appName,
      getPages: AppPages.pages,
      home: MainPage(),
      initialBinding: MainBinding(),
      theme: R.theme.lightTheme,
      defaultTransition: Transition.cupertino,
      popGesture: false,
      builder: EasyLoading.init(),
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
