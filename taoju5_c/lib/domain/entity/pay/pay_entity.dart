/*
 * @Description: 支付
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:17:24
 * @LastEditTime: 2021-06-25 17:08:24
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/rendering.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import 'package:tobias/tobias.dart' as tobias;

enum AliPayStatusCode {
  success,
  ing,
  failure,
  repeatRequest,
  userCancel,
  netError,
  unknownResult,
  otherError
}

extension AliPayStatusCodeKit on AliPayStatusCode {
  int get code =>
      {
        AliPayStatusCode.success: 9000,
        AliPayStatusCode.ing: 8000,
        AliPayStatusCode.failure: 4000,
        AliPayStatusCode.repeatRequest: 5000,
        AliPayStatusCode.userCancel: 6001,
        AliPayStatusCode.netError: 6002,
        AliPayStatusCode.unknownResult: 6004
      }[this] ??
      -1;
  String get message =>
      {
        AliPayStatusCode.success: "订单支付成功",
        AliPayStatusCode.ing: "正在处理中，支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态",
        AliPayStatusCode.failure: "订单支付失败",
        AliPayStatusCode.repeatRequest: "重复请求",
        AliPayStatusCode.userCancel: "用户中途取消",
        AliPayStatusCode.netError: "网络连接出错",
        AliPayStatusCode.unknownResult: "支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态"
      }[this] ??
      "";
}

abstract class PayStrategy {
  Future pay(PayOrderEntity order, {Function? callback});

  Future auth();

  int get code;

  operator ==(p) {
    return this == p;
  }

  @override
  int get hashCode => hashValues(code, 0);

  late bool selected;
}

class AliPayStrategy implements PayStrategy {
  @override
  Future pay(PayOrderEntity order, {Function? callback}) {
    // tobias.aliPayAuth(jso)
    order = order as AliPayOrderEntity;

    return tobias.aliPay(order.params).then((value) {
      int code = JsonKit.asInt(value["resultStatus"]);

      if (code != AliPayStatusCode.success.code) {
        throw value;
      }
      if (callback != null) {
        callback();
      }
      // ToastKit.warning(message)
    }).catchError((err, StackTrace s) {
      print(err);
      print(s);
      print("支付失败");
      throw err;
    });
  }

  @override
  Future auth() => Future.value(true);

  @override
  int get code => 1;

  @override
  bool selected = true;
}

class WechatPayStrategy implements PayStrategy {
  @override
  Future pay(PayOrderEntity order, {Function? callback}) {
    order = order as WxPayOrderEntity;

    return fluwx
        .payWithWeChat(
      appId: order.appId,
      nonceStr: order.nonceStr,
      packageValue: order.package,
      partnerId: order.partnerid,
      prepayId: order.prepayId,
      sign: order.sign,
      timeStamp: order.timestamp,
    )
        .then((value) {
      if (value == false) {
        throw "支付失败";
      }
      print(value);
    }).catchError((err) {
      throw err;
    });
  }

  @override
  Future auth() => Future.value(true);

  @override
  int get code => 2;

  @override
  bool selected = false;
}

class PayEntity {
  late String label;
  late String icon;
  late double price;

  late PayStrategy strategy;

  late bool selected;

  PayEntity(
      {required this.label,
      required this.icon,
      required this.price,
      this.selected = false,
      required this.strategy});

  operator ==(p) {
    if (p is PayEntity) {
      return this.label == p.label;
    }
    return false;
  }

  @override
  int get hashCode => hashValues(label, icon);
}

abstract class PayOrderEntity {
  late String orderId;
  late dynamic params;
}

class AliPayOrderEntity implements PayOrderEntity {
  AliPayOrderEntity.fromJson(Map json) {
    params = json["pay_param"];
    orderId = json["order_id"];
  }

  @override
  late String orderId;

  @override
  late var params;
}

class WxPayOrderEntity implements PayOrderEntity {
  late String appId;
  late String mchId;
  late String nonceStr;
  late String prepayId;
  late String resultCode;
  late String returnCode;
  late String returnMsg;
  late String sign;
  late String tradeType;
  late String partnerid;
  late String package;
  late int timestamp;
  late int timeExpire;

  WxPayOrderEntity.fromJson(Map json) {
    orderId = json["order_id"];
    json = json["pay_param"] ?? {};
    appId = json["appid"];
    mchId = json["mch_id"];
    nonceStr = json["noncestr"];
    prepayId = json["prepayid"];
    resultCode = json["result_code"];
    resultCode = json["return_code"];
    returnMsg = json["return_msg"];
    sign = json["sign"];
    tradeType = json["trade_type"];
    timeExpire = JsonKit.asInt(json["time_expire"]);
    partnerid = "${json["partnerid"]}";
    package = json["package"];
    timestamp = JsonKit.asInt(json["timestamp"]);
  }

  @override
  late String orderId;

  @override
  late var params = {};
}
