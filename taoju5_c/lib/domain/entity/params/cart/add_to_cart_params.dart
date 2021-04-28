/*
 * @Description: 添加到购物车里面的参数
 * @Author: iamsmiling
 * @Date: 2021-04-27 15:44:23
 * @LastEditTime: 2021-04-27 15:57:51
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

class AddToCartParamsEntity extends BaseParamsEntity {
  ProductDetailEntity product;

  AddToCartParamsEntity({required this.product});
  @override
  Map get params {
    Map map = {
      "goods_id": product.id,
      "cart_tag": "app",
      "sku_id": product.currentSku?.id,
      "num": product.count,
      "sku_name": product.currentSku?.name,
    };
    if (product.productType is FinishedProductType) {
      map.addAll({"estimated_price": product.currentSku?.price});
      return map;
    }

    return {"cart_tag": "app"};
  }

  @override
  bool validate() => true;
}
