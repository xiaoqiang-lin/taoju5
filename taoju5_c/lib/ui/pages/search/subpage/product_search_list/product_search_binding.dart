/*
 * @Description: 商品搜索
 * @Author: iamsmiling
 * @Date: 2021-07-15 14:51:36
 * @LastEditTime: 2021-07-15 15:53:44
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ProductListParentController(CategoryEntity(id: -1, name: "")));
  }
}
