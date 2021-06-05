/*
 * @Description: 路由中间件
 * @Author: iamsmiling
 * @Date: 2021-01-04 17:03:50
 * @LastEditTime: 2021-06-04 14:24:01
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:taoju5_b/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5_b/xdio/x_dio.dart';

import 'bapp_routes.dart';

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

    ///进入商品详情页
    if (RegExp(BAppRoutes.productDetail).hasMatch(routing?.current)) {
      // if (Get.isRegistered<ProductRegisterController>()) {
      //   ProductRegisterController registerController = Get.find();
      //   if (registerController.pageManager.hasOverflow) {
      //     Get.offAndToNamed(Get.currentRoute);
      //   }
      // }
    }
  }
}
