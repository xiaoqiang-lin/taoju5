/*
 * @Description: 添加到购物车里面的参数
 * @Author: iamsmiling
 * @Date: 2021-04-27 15:44:23
 * @LastEditTime: 2021-05-14 15:39:57
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/matching_set_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/validator/validator.dart';

class AddToCartParamsEntity extends BaseParamsEntity {
  ProductDetailEntity product;

  MatchingSetParamsEntity? matchingSet;

  int? measureId;

  AddToCartParamsEntity(
      {required this.product, this.matchingSet, this.measureId});
  @override
  Map get params {
    Map map = {
      "goods_id": product.id,
      "cart_tag": "app",
      "sku_id": product.currentSku?.id,
      "num": product.count,
      "sku_name": product.currentSku?.name,
      "measure_id": measureId ?? -1,
      "estimated_price": product.price
    };
    if (product.productType is FinishedProductType) {
      map.addAll({"estimated_price": product.currentSku?.price});
      return map;
    }
    if (matchingSet != null) {
      map.addAll(matchingSet!.params);
    }
    return map;
  }

  @override
  bool validate() {
    bool flag = ValidatorManager()
            .addValidator(EmptyValidator(
                field: measureId?.toString(), errorMessage: "测量id不能为空"))
            .executeAll() &&
        (matchingSet == null ? true : matchingSet!.validate());
    if (flag) return true;
    throw ArgumentError("购物车参数错误");
  }
}
