/*
 * @Description: 软装方案binding
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:53:39
 * @LastEditTime: 2021-01-09 20:00:24
 */
import 'package:get/get.dart';

import 'soft_product_detail_controller.dart';

class SoftProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SoftProductDetailController());
  }
}
