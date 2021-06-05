/*
 * @Description: app页面
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:05:26
 * @LastEditTime: 2021-06-04 15:59:08
 */
import 'package:flutter/material.dart';
import 'package:taoju5/pages/404/not_found_page.dart';
import 'package:taoju5/pages/login_guide/login_guide_page.dart';
import 'package:taoju5/routes/app_routes.dart';
import 'package:taoju5_b/routes/bapp_pages.dart' as b;

import 'package:taoju5_c/routes/app_pages.dart' as c;
import 'package:get/get.dart';

import 'package:taoju5_b/app.dart';
import 'package:taoju5_c/app.dart';
import 'package:taoju5_b/res/b_theme.dart';
import 'package:taoju5_b/ui/pages/home/home_binding.dart';

class AppPages {
  static final unkonw =
      GetPage(name: AppRoutes.unknow, page: () => NotFound404Page());
  static final pages = [
    GetPage(name: AppRoutes.loginGuide, page: () => LoginGuidePage()),
    GetPage(name: AppRoutes.unknow, page: () => NotFound404Page()),
    GetPage(
        name: AppRoutes.b,
        page: () => Theme(
              data: BTheme.lightTheme,
              child: $BApp(),
            ),
        binding: TaojuwuBinding(),
        children: b.BAppPages.pages),
    GetPage(name: AppRoutes.c, page: () => $CAPP(), children: c.AppPages.pages),
  ];
}
