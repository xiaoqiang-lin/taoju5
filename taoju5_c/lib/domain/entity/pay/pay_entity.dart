/*
 * @Description: 支付
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:17:24
 * @LastEditTime: 2021-05-17 13:58:41
 */

import 'package:tobias/tobias.dart' as tobias;

abstract class PayStrategy {
  Future pay(String orderNo);

  Future auth();
}

class AliPayStrategy implements PayStrategy {
  @override
  Future pay(String orderNo) {
    // tobias.aliPayAuth(jso)
    return tobias.aliPay(orderNo);
  }

  @override
  Future auth() {
    // TODO: implement auth
    throw UnimplementedError();
  }
}

class WechatPayStrategy implements PayStrategy {
  @override
  Future pay(String orderNo) {
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
