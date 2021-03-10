/*
 * @Description: 路由中间件
 * @Author: iamsmiling
 * @Date: 2021-01-04 17:03:50
 * @LastEditTime: 2021-01-25 10:18:23
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5/xdio/x_dio.dart';

class BAppRouteMiddleWare extends RouteObserver {
  static observer(Routing routing) {
    ///是否来自分享
    if (RegExp(BAppRoutes.productShare).hasMatch(routing?.current)) {
      Map params = Get.parameters;
      UserProviderController controller = Get.find<UserProviderController>();
      controller?.token ??= params["token"];
      XDio().refreshToken(controller?.token);
      controller?.loadData();
    }
  }
}
