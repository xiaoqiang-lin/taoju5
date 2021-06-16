/*
 * @Description: 登录鉴权
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:20:41
 * @LastEditTime: 2021-06-07 10:41:33
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/local_storage/local_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 9;

  @override
  RouteSettings? redirect(String? route) {
    return LocalStorage.get("token") != null
        ? null
        : RouteSettings(name: AppRoutes.loginGuide);
  }
}
