/*
 * @Description: 选品参数
 * @Author: iamsmiling
 * @Date: 2021-07-05 14:56:51
 * @LastEditTime: 2021-07-08 14:52:56
 */
import 'package:taoju5_c/domain/entity/params/order/matching_set_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

import '../base_params_entity.dart';

class SelectProductParamsEntity extends BaseParamsEntity {
  late ProductDetailEntity product;
  late String orderProductId;
  SelectProductParamsEntity(
      {required this.orderProductId, required this.product});
  @override
  Map get params {
    MatchingSetParamsEntity arg =
        MatchingSetParamsEntity(attribute: product.attribute.matchingSet);
    Map map = arg.params;
    map.addAll({"sku_id": product.currentSku?.id, "num": product.count});
    return {"order_goods_id": orderProductId, "sku_info": map};
  }

  @override
  bool validate() {
    return true;
  }
}
