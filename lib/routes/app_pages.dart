/*
 * @Description: app页面
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:05:26
 * @LastEditTime: 2021-06-07 11:12:22
 */
import 'package:taoju5/pages/404/not_found_page.dart';
import 'package:taoju5/pages/login_guide/login_guide_page.dart';
import 'package:taoju5/routes/app_routes.dart';
import 'package:taoju5_b/routes/bapp_pages.dart' as b;

import 'package:taoju5_c/routes/app_pages.dart' as c;
import 'package:get/get.dart';

class AppPages {
  static final unkonw =
      GetPage(name: AppRoutes.unknow, page: () => NotFound404Page());
  static final pages = [
    GetPage(name: AppRoutes.loginGuide, page: () => LoginGuidePage()),
    GetPage(name: AppRoutes.unknow, page: () => NotFound404Page()),
    ...b.BAppPages.pages,
    ...c.AppPages.pages
    // GetPage(
    //     name: AppRoutes.c,
    //     page: () => Theme(data: R.theme.lightTheme, child: $CAPP()),
    //     binding: MainBinding(),
    //     children: c.AppPages.pages),
  ];
}
