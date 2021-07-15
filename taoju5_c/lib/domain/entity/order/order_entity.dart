/*
 * @Description: 订单列表数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:49:46
 * @LastEditTime: 2021-07-07 15:17:48
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';

enum OrderType {
  ///选品单
  selectOrder,

  ///测量单
  measureOrder
}

class OrderListWrapperEntity {
  late List<OrderEntity> orders;
  late CancelOrderReasonEntity reason;

  OrderListWrapperEntity.fromJson(Map json) {
    orders = JsonKit.asList(json["data"])
        .map((e) => OrderEntity.fromJson(e))
        .toList();
    reason = CancelOrderReasonEntity.fromJson(json["reason"]);
    orders.forEach((element) {
      element.reason = reason;
    });
  }
}

class OrderEntity {
  late int id;
  late String no;

  late int _orderTypeCode;

  late List<ProductAdaptorEntity> products;

  late String tip;

  late List<OrderActionButtonEntity> actions;

  late String cancelOrderMessage;

  late double amount;

  late CancelOrderReasonEntity reason;

  OrderType get orderType =>
      {1: OrderType.selectOrder, 2: OrderType.measureOrder}[_orderTypeCode] ??
      OrderType.selectOrder;

  OrderEntity.fromJson(Map json) {
    id = json["order_id"];
    no = json["order_no"];
    _orderTypeCode = json["order_type"];
    tip = json["money"];
    products = JsonKit.asList(json["goods_list"])
        .map((e) => ProductAdaptorEntity.fromJson(e))
        .toList();
    actions = JsonKit.asList(json["button"])
        .map((e) => OrderActionButtonEntity.fromJson(e))
        .toList();
    cancelOrderMessage = json["refund_hint"];
    amount = JsonKit.asDouble(json["pay_money"]);
  }
}

class OrderActionButtonEntity {
  late bool enabled;
  late String text;

  late int actionCode;

  late int _modeCode;

  PrimaryButtonMode get mode =>
      {
        0: PrimaryButtonMode.inkwellButton,
        1: PrimaryButtonMode.elevatedButton,
        2: PrimaryButtonMode.inkwellButton,
        3: PrimaryButtonMode.textButton,
      }[_modeCode] ??
      PrimaryButtonMode.textButton;

  OrderActionButtonEntity.fromJson(Map json) {
    enabled = JsonKit.asBool(json["enable"]);
    _modeCode = json["color"];
    text = json["name"];
    actionCode = json["type"];
  }
}
