/*
 * @Description: 登录鉴权
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:20:41
 * @LastEditTime: 2021-04-28 10:21:02
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 9;

  @override
  onPageBuildStart(page) {
    print("开始执行中间件");
    return super.onPageBuildStart(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    print(route);
    print("执行路由中间件函数");

    return null;
  }
}
