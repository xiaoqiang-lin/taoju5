/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:04:06
 * @LastEditTime: 2021-05-06 09:28:25
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/res/R.dart';

abstract class PayStrategy {
  Future pay();
}

// class AliPayStrategy implements PayStrategy {
//   @override
//   Future pay() {
//     // TODO: implement pay
//     throw UnimplementedError();
//   }

// }

class PayController extends GetxController {
  double price = 1999.00;

  int get integerPrice => price.toInt();

  String get decimalPrice {
    String val = price.toStringAsFixed(2);
    int index = val.indexOf(".");
    return val.substring(index);
  }

  List<PayEntity> options = [
    PayEntity(icon: R.image.aliPay, label: "支付宝支付", price: 1999, checked: true),
    PayEntity(
        icon: R.image.wechatPay, label: "微信支付", price: 1999, checked: false)
  ];
}
