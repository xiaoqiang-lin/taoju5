/*
 * @Description: ProductListBinding
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:33:14
 * @LastEditTime: 2020-12-21 14:09:13
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductListParentController());
  }
}
