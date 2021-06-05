/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:04:06
 * @LastEditTime: 2021-06-04 10:38:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/res/R.dart';

import 'package:fluwx/fluwx.dart' as fluwx;

class PayController extends GetxController {
  late double price;
  late PayStrategy payStrategy;

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
      print(event.errCode);
      print(event.errStr);
      // 支付成功
      if (event.errCode == 0) {}
      // 关闭弹窗
    });
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

    update(["pay"]);
  }

  Future<PayOrderEntity> createOrder() {
    OrderRepository repository = OrderRepository();

    ///如果商品列表为空 说明是测量
    if (arg.products.isEmpty) {
      return repository.createMeasureOrder(arg.params);
    }
    return repository.createOrder(arg.params);
  }

  Future pay() {
    return createOrder().then((PayOrderEntity value) {
      payStrategy.pay(value);
    });
    // ToastKit.loading();
    // print(arg.params);
    // return repository.createMeasureOrder(arg.params).then((value) {
    //   payStrategy.pay(value);
    // }).whenComplete(ToastKit.dismiss);
  }
}
