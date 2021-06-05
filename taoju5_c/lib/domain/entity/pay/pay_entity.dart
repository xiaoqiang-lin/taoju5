/*
 * @Description: 支付
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:17:24
 * @LastEditTime: 2021-06-04 10:27:09
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/rendering.dart';
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import 'package:tobias/tobias.dart' as tobias;

abstract class PayStrategy {
  Future pay(PayOrderEntity order);

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
  Future pay(PayOrderEntity order) {
    // tobias.aliPayAuth(jso)
    order = order as AliPayOrderEntity;

    return tobias.aliPay(order.params).then((value) {
      print(value);
      print("支付成功");
      // ToastKit.warning(message)
    }).catchError((err) {
      print("支付失败");
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
  Future pay(PayOrderEntity order) {
    order = order as WxPayOrderEntity;
    print(order);
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
      print(value);
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

abstract class PayOrderEntity {}

class AliPayOrderEntity implements PayOrderEntity {
  late String url;
  late dynamic params;

  AliPayOrderEntity.fromJson(dynamic json) {
    params = json;
  }
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
    appId = json["appid"];
    mchId = json["mch_id"];
    nonceStr = json["nonce_str"];
    prepayId = json["prepay_id"];
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
}
