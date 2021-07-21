/*
 * @Description: 退货退款商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 10:12:06
 * @LastEditTime: 2021-07-16 10:41:26
 */

import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import '../base_params_entity.dart';

class RefundProductParamsEntity extends BaseParamsEntity {
  late List<ProductAdaptorEntity> products;
  late CancelOrderReasonEntity cancelOrderReason;
  late Map formData = {};
  late String orderId;
  RefundProductParamsEntity(
      {required this.products,
      required this.cancelOrderReason,
      required this.orderId});

  String reason = "请选择";
  String description = "";

  @override
  Map get params => {
        "order_id": orderId,
        "order_goods_id": products.map((e) => e.id).join(","),
        "refund_type": 1,
        "order_close_reason": reason,
        "order_reason_desc": description,
        "refund_require_money":
            products.map((e) => e.totalPrice).reduce((a, b) => a + b),
        "refund_pic": formData,
      };

  @override
  bool validate() => true;
}
