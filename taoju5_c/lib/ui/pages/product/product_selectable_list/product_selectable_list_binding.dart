/*
 * @Description:选品
 * @Author: iamsmiling
 * @Date: 2021-07-01 10:30:55
 * @LastEditTime: 2021-07-01 14:37:59
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductSelectableListBinding extends Bindings {
  @override
  void dependencies() {
    final c = CategoryEntity(name: "选品", id: 0);
    Get.lazyPut(() => ProductListParentController(c));
    Get.lazyPut(() => ProductListController(c), tag: "0");
  }
}
