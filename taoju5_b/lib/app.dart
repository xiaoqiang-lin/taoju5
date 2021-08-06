/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:22:15
 * @LastEditTime: 2021-07-26 14:06:26
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taoju5_bc/config/app_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:taoju5_b/bapp/ui/widgets/pages/home/home_page.dart';

import 'res/b_theme.dart';
import 'routes/bapp_pages.dart';
import 'routes/bapp_route_middleware.dart';
import 'ui/pages/home/home_binding.dart';

class $BApp extends StatelessWidget {
  const $BApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      unknownRoute: BAppPages.unkonw,
      getPages: BAppPages.pages,
      theme: BTheme.lightTheme,

      // themeMode: ThemeMode.dark,
      initialRoute: BAppPages.initial,
      initialBinding: TaojuwuBinding(),
      builder: EasyLoading.init(),
      defaultTransition: Transition.cupertino,
      popGesture: false,
      // defaultTransition: Transition,
      debugShowCheckedModeBanner: AppConfig.isDebug,
      // debugShowCheckedModeBanner: true,
      localizationsDelegates: [
        // CupertinoLocalizationDelegate.delegate,
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
      ],
      supportedLocales: [Locale("en"), Locale("zh")],
      routingCallback: BAppRouteMiddleWare.observer,
      // navigatorKey: Get.key,
    );
  }
}
