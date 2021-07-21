/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:04:06
 * @LastEditTime: 2021-07-17 17:08:00
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/res/R.dart';

import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:taoju5_c/routes/app_routes.dart';

class PayController extends GetxController {
  late double price;
  late PayStrategy payStrategy;
  late PayOrderEntity payOrder;

  CreateOrderParamsEntity arg;
  PayController({required this.arg}) {
    price = arg.totalPrice;
    payStrategy = arg.payStrategy;
  }
  @override
  void onInit() {
    super.onInit();
    // 监听支付结果
    fluwx.weChatResponseEventHandler.listen((event) async {
      // 支付成功
      if (event.errCode == 0) {}
      if (event is fluwx.WeChatPaymentResponse) {
        if (event.isSuccessful) {
          afterPaySuccess();
        }
      }
      // 关闭弹窗
    });
  }

  void afterPaySuccess() {
    Get.back();
    Get.back();
    Get.toNamed(AppRoutes.commitOrderSuccess + "/${payOrder.orderId}");
  }

  void onClose() {}

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
        selected: true,
        strategy: AliPayStrategy()),
    PayEntity(
        icon: R.image.wechatPay,
        label: "微信支付",
        price: 1999,
        strategy: WechatPayStrategy())
  ];

  void selectPayStrategy(PayEntity p, bool flag) {
    // payStrategy = strategy;
    // arg.payStrategy = strategy;
    options.forEach((e) {
      e.selected = e == p ? flag : !flag;
      if (e.selected) {
        payStrategy = e.strategy;
      }
    });
    arg.payStrategy = payStrategy;

    update(["pay"]);
  }

  Future<PayOrderEntity> sendPayRequest() {
    OrderRepository repository = OrderRepository();
    return repository.sendPayRequest(arg.path, params: arg.params);
  }

  Future? pay() {
    // Get.back();
    // Get.back();
    // return Get.toNamed(AppRoutes.commitOrderSuccess);

    return sendPayRequest().then((PayOrderEntity value) {
      payOrder = value;
      payStrategy.pay(value, callback: afterPaySuccess);
    });
  }
}
