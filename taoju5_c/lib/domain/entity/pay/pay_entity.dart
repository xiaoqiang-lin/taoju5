/*
 * @Description: 支付
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:17:24
 * @LastEditTime: 2021-05-06 10:20:08
 */
abstract class PayStrategy {
  Future pay();
}

class AliPayStrategy implements PayStrategy {
  @override
  Future pay() {
    // TODO: implement pay
    throw UnimplementedError();
  }
}

class WechatPayStrategy implements PayStrategy {
  @override
  Future pay() {
    // TODO: implement pay
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
