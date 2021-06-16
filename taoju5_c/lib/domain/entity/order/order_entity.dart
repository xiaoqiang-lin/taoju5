/*
 * @Description: 订单列表数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:49:46
 * @LastEditTime: 2021-06-11 15:01:50
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';

enum OrderType {
  ///选品单
  selectOrder,

  ///测量单
  measureOrder
}

class OrderListWrapperEntity {
  late List<OrderEntity> orders;
  late List<OrderTabEntity> tabs;

  OrderListWrapperEntity.fromJson(Map json) {
    orders = JsonKit.asList(json["order_list"]["data"])
        .map((e) => OrderEntity.fromJson(e))
        .toList();
    tabs = JsonKit.asList(json["order_title"])
        .map((e) => OrderTabEntity.fromJson(e))
        .toList();
  }
}

class OrderEntity {
  late int id;
  late String no;

  late int _orderTypeCode;

  late List<ProductAdaptorEntity> products;

  late String tip;

  late List<OrderActionButtonEntity> actions;

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
  }
}

class OrderActionButtonEntity {
  late bool enabled;
  late String text;

  late int actionCode;

  late int _modeCode;

  late int action;

  PrimaryButtonMode get mode =>
      {
        1: PrimaryButtonMode.inkwellButton,
        2: PrimaryButtonMode.elevatedButton,
        3: PrimaryButtonMode.textButton,
      }[_modeCode] ??
      PrimaryButtonMode.textButton;

  OrderActionButtonEntity.fromJson(Map json) {
    enabled = JsonKit.asBool(json["enable"]);
    _modeCode = json["type"];
    text = json["name"];
    action = 1;
  }
}
