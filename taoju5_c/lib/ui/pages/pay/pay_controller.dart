/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:04:06
 * @LastEditTime: 2021-05-19 15:31:36
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/utils/toast.dart';

class PayController extends GetxController {
  double price = 1999.00;

  int get integerPrice => price.toInt();

  String get decimalPrice {
    String val = price.toStringAsFixed(2);
    int index = val.indexOf(".");
    return val.substring(index);
  }

  List<PayEntity> options = [
    PayEntity(
        icon: R.image.aliPay,
        label: "支付宝支付",
        price: 1999,
        checked: true,
        strategy: AliPayStrategy()),
    PayEntity(
        icon: R.image.wechatPay,
        label: "微信支付",
        price: 1999,
        checked: false,
        strategy: WechatPayStrategy())
  ];

  PayStrategy get currentPayStrategy =>
      options.firstWhere((e) => e.checked).strategy;

  void selectPayMode(PayEntity option, bool flag) {
    options.forEach((e) {
      e.checked = e == option;
      print(e.label + e.checked.toString());
    });

    update(["pay"]);
    // options.forEach((element) {
    //   element.checked = element == option && flag;
    // });
    // update();
  }

  Future pay() {
    OrderRepository repository = OrderRepository();
    CreateOrderParamsEntity arg = Get.arguments;
    ToastKit.loading();
    return repository.createMeasureOrder(arg.params).then((value) {
      currentPayStrategy.pay(value);
    }).whenComplete(ToastKit.dismiss);
  }
}
