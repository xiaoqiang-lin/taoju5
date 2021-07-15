/*
 * @Description: 创建订单参数
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:35:11
 * @LastEditTime: 2021-07-06 17:55:23
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';

class CreateOrderParamsEntity extends BaseParamsEntity {
  late int addressId;
  String? orderRemark;
  bool needMeasure = true;
  List<ProductAdaptorEntity> products;
  late String path;

  PayStrategy payStrategy = AliPayStrategy();
  CreateOrderExtraParamsEntity extra = CreateOrderExtraParamsEntity();

  String orderId = "";
  late double? amount;

  double totalPrice = 0;

  CreateOrderParamsEntity(
      {this.addressId = -1,
      this.orderRemark,
      this.products = const [],
      this.orderId = "",
      this.amount,
      this.path = "/app/order/orderCreate",
      this.totalPrice = 0});

  @override
  Map get params {
    if (orderId.isNotEmpty) {
      return {"order_id": orderId, "pay_type": payStrategy.code};
    }
    return {
      "address_id": addressId,
      "order_remark": orderRemark,
      "mea_inst_info": extra.params,
      "goods_sku_list": products.map((e) => e.params).toList(),
      "is_mea_inst": needMeasure ? 1 : 0,
      "pay_type": payStrategy.code
    };
  }

  @override
  bool validate() => true;
}

class CreateOrderExtraParamsEntity extends BaseParamsEntity {
  String? measureTime;
  String? installTime;

  ///定金默认为100
  double deposit;
  String? windowCount;

  CreateOrderExtraParamsEntity(
      {this.deposit = 100,
      this.installTime,
      this.windowCount = '20',
      this.measureTime});

  @override
  Map get params => {
        "measure_time": measureTime,
        "install_time": installTime,
        "order_earnest_money": deposit,
        "order_window_num": windowCount
      };

  @override
  bool validate() => true;
}
