/*
 * @Description: CartBinding
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:29:52
 * @LastEditTime: 2021-01-16 00:01:23
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_tab_model.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartListParentController());

    for (ProductTabModel tab in Get.find<CartListParentController>().tabList) {
      Get.lazyPut(() => CartListController({"category_type": tab.id}),
          tag: "${tab.id}");
    }
  }
}
