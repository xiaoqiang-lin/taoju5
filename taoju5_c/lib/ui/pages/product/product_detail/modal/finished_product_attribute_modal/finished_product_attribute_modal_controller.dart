/*
 * @Description: 成品属性选择
 * @Author: iamsmiling
 * @Date: 2021-04-26 14:13:23
 * @LastEditTime: 2021-04-26 14:46:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';

class FinishedProductAttributeController extends GetxController {
  final ProductDetailEntity product;

  FinishedProductAttributeController({required this.product});

  void select(ProductSpecEntity spec, ProductSpecOptionEntity option) {
    for (ProductSpecOptionEntity o in spec.options) {
      o.selected = o == option;
    }
    update();
  }
}
