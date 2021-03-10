/*
 * @Description:选品
 * @Author: iamsmiling
 * @Date: 2021-01-10 13:24:28
 * @LastEditTime: 2021-01-10 13:25:28
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';

class SelectableProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectableProductListController());
  }
}
