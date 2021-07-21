/*
 * @Description: 成品属性选择
 * @Author: iamsmiling
 * @Date: 2021-04-26 14:13:23
 * @LastEditTime: 2021-07-20 10:26:19
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/price_delegator/price_delegator.dart';

class FinishedProductAttributeController extends GetxController {
  final ProductDetailEntity product;
  late BaseProductPriceDelegator priceDelegator;

  FinishedProductAttributeController({required this.product}) {
    priceDelegator = FinishedProductPriceDelegator(product);
  }

  void select(ProductSpecEntity spec, ProductSpecOptionEntity option) {
    for (ProductSpecOptionEntity o in spec.options) {
      o.selected = o == option;
    }
    product.specTip = product.currentSpecName;
    update();
  }

  void setCount(int i) {
    product.count = i;
    update();
  }
}
