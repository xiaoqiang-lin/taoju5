/*
 * @Description: 登录引导控制器
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:12:22
 * @LastEditTime: 2021-06-07 14:05:15
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';

import 'package:taoju5_b/res/b_theme.dart';
import 'package:taoju5_c/res/R.dart';

enum UserRole { customer, business }

extension UserRoleKit on UserRole {
  ThemeData get theme =>
      {
        UserRole.customer: R.theme.lightTheme,
        UserRole.business: BTheme.lightTheme
      }[this] ??
      R.theme.lightTheme;
}

class LoginGuideController extends GetxController {
  UserRole role = UserRole.customer;

  changeTheme({UserRole role = UserRole.customer}) {
    // Get.rootController.restartApp();
    Get.changeTheme(role.theme);
    Get.rootController.restartApp();
    // Get.forceAppUpdate();
    print("更换˙祖逖----");
    //
  }

  loginAsCustomer() {
    // Get.changeTheme(R.theme.lightTheme);
    changeTheme(role: UserRole.customer);

    return Get.toNamed(AppRoutes.customerPasswordLogin);
  }

  loginAsBussiness() {
    // print(BAppRoutes.login);
    changeTheme(role: UserRole.business);
    Get.toNamed(BAppRoutes.login);
  }
}
