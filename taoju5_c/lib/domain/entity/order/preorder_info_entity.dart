/*
 * @Description: 预提交的订单信息
 * @Author: iamsmiling
 * @Date: 2021-07-13 10:33:27
 * @LastEditTime: 2021-07-14 14:34:26
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class PreOrderInfoEntity {
  late double freightFee;
  late String promise;
  late String chart;
  late double deposit;

  PreOrderInfoEntity.fromJson(Map json) {
    freightFee = JsonKit.asDouble(json["shipping_money"]);
    deposit = JsonKit.asDouble(json["earnest_money"]);
    chart = JsonKit.asWebUrl(json["order_flow_picture"]);
    promise = json["promise1"];
  }
}
