/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:30:05
 * @LastEditTime: 2021-04-23 18:00:21
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    assert(Get.arguments is CategoryEntity, "please provide a category");
    Get.lazyPut(() => ProductListController(Get.arguments));
  }
}
