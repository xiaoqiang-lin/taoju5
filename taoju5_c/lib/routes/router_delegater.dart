/*
 * @Description: app路由代理
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:31:31
 * @LastEditTime: 2021-06-07 11:15:08
 */
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class RouterDelegater {
  static Future? toLoginPage() => Get.offAndToNamed(AppRoutes.loginGuide);

  static Future? toOfflinePage() => Get.toNamed(AppRoutes.netOff);
}
