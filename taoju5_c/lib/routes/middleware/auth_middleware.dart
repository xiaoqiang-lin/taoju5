/*
 * @Description: 登录鉴权
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:20:41
 * @LastEditTime: 2021-06-03 15:15:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/service/prefs_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 9;

  @override
  RouteSettings? redirect(String? route) {
    final GetLocalStorage localStorage = Get.find();
    print(localStorage.authed);
    print("鉴权是否成功---${localStorage.authed}");
    return localStorage.authed
        ? null
        : RouteSettings(name: AppRoutes.loginGuide);
  }
}
