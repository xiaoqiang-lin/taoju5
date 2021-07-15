/*
 * @Description: 选择需要退款的商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:42:48
 * @LastEditTime: 2021-07-12 16:46:12
 */
import 'package:get/get.dart';

import 'select_refund_product_controller.dart';

class SelectRefundProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectRefundProductController());
  }
}
