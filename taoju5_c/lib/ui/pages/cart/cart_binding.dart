/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:34:52
 * @LastEditTime: 2021-04-21 14:35:53
 */

import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
