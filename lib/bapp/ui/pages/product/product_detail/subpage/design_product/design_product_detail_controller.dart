/*
 * @Description: 设计类产品
 * @Author: iamsmiling
 * @Date: 2021-01-23 16:20:14
 * @LastEditTime: 2021-01-23 16:24:42
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';

abstract class DesignProductDetailController extends GetxController {
  ProductRepository repository = ProductRepository();
  DesignProductDetailModel product;
  List<ProductModel> list;
  Future loadData();

  commit() {}

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
