/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:30:05
 * @LastEditTime: 2021-05-18 17:46:29
 */
import 'package:get/get.dart';

import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListParentController(Get.arguments));
    // Get.putAsync(()=>);
    // Get.lazyPut(() => ProductListController(Get.arguments));
  }
}
