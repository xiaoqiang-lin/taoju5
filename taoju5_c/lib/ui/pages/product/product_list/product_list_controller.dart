/*
 * @Description: 商品列表逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:29:16
 * @LastEditTime: 2021-04-23 20:48:46
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';

class ProductListController extends GetxController {
  ProductRepository repository = ProductRepository();

  CategoryEntity category;

  ProductListController(this.category);

  late List<ProductEntity> products;

  Future loadData() {
    return repository.productList({"category_id": category.id}).then((value) {
      products = value;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
