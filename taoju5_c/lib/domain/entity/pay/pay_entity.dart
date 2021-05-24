/*
 * @Description: 支付
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:17:24
 * @LastEditTime: 2021-05-19 15:34:32
 */

import 'dart:convert';

import 'package:taoju5_c/utils/toast.dart';
import 'package:tobias/tobias.dart' as tobias;

abstract class PayStrategy {
  Future pay(PayOrderEntity order);

  Future auth();
}

class AliPayStrategy implements PayStrategy {
  @override
  Future pay(PayOrderEntity order) {
    // tobias.aliPayAuth(jso)

    return tobias.aliPay(jsonEncode(order.params)).then((value) {
      print(value);
      print("支付成功");
      // ToastKit.warning(message)
    }).catchError((err) {
      print("支付失败");
    });
  }

  @override
  Future auth() {
    // TODO: implement auth
    throw UnimplementedError();
  }
}

class WechatPayStrategy implements PayStrategy {
  @override
  Future pay(PayOrderEntity order) {
    // TODO: implement pay
    throw UnimplementedError();
  }

  @override
  Future auth() {
    // TODO: implement auth
    throw UnimplementedError();
  }
}

class PayEntity {
  late String label;
  late String icon;
  late double price;
  late bool checked;
  late PayStrategy strategy;

  PayEntity(
      {this.checked = false,
      required this.label,
      required this.icon,
      required this.price,
      required this.strategy});
}

class PayOrderEntity {
  late String url;
  late Map params;

  PayOrderEntity.fromJson(Map json) {
    url = json["url"];
    params = json["params"];
  }
}
