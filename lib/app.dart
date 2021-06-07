/*
 * @Description: app
 * @Author: iamsmiling
 *  @Date: 2021-02-03 10:26:46
 * @LastEditTime: 2021-06-07 10:21:45
 */
import 'package:flutter/material.dart';
import 'package:taoju5/app/app_binding.dart';
import 'package:taoju5/routes/app_pages.dart';
import 'package:taoju5/routes/app_routes.dart';
import 'package:taoju5_bc/config/app_env.dart';

import 'package:taoju5_b/app.dart';
import 'package:taoju5_c/app.dart';
// import 'package:taoju5_bc/config/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:taoju5_b/ui/pages/home/home_binding.dart';

class TaojuwuApp extends StatelessWidget {
  const TaojuwuApp({Key key}) : super(key: key);
  static const Map<AppEnv, Widget> APP_ENV = {
    AppEnv.$b: $BApp(),
    AppEnv.$c: $CAPP()
  };
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   unknownRoute: AppPages.unkonw,
    //   theme: R.theme.lightTheme,
    //   initialRoute: AppRoutes.loginGuide,
    //   getPages: AppPages.pages,
    // );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(constraints,
            orientation: Orientation.portrait, designSize: Size(750, 1334));
        return GetMaterialApp(
          unknownRoute: AppPages.unkonw,
          initialRoute: AppRoutes.loginGuide,
          getPages: AppPages.pages,
          builder: EasyLoading.init(),
          initialBinding: AppBinding(),
          defaultTransition: Transition.cupertino,
        );
      },
    );
  }
}
