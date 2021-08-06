/*
 * @Description: 预提交的订单信息
 * @Author: iamsmiling
 * @Date: 2021-07-13 10:33:27
 * @LastEditTime: 2021-07-23 09:13:38
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';

class PreOrderInfoEntity {
  late double freightFee;
  late String promise;
  late String chart;
  late double deposit;
  late PreOrderBillEntity bill;
  late double money;
  late AddressEntity? address;
  PreOrderInfoEntity.fromJson(Map json) {
    freightFee = JsonKit.asDouble(json["shipping_money"]);
    deposit = JsonKit.asDouble(json["earnest_money"]);
    chart = JsonKit.asWebUrl(json["order_flow_picture"]);
    promise = json["promise"];
    bill = PreOrderBillEntity.fromJson(JsonKit.asMap(json["money_list"]));
    money = JsonKit.asDouble(json["extra_money"]);
    address = JsonKit.asMap(json["address_info"]).isEmpty
        ? null
        : AddressEntity.fromJson(json["address_info"]);
  }
}

class PreOrderBillEntity {
  late List<PreOrderBillItemEntity> billWithMeasureFee;
  late List<PreOrderBillItemEntity> billNoMeasureFee;
  late List<PreOrderBillItemEntity> measureOrderBill;

  PreOrderBillEntity.fromJson(Map json) {
    billWithMeasureFee = JsonKit.asList(json["is_mea"])
        .map((e) => PreOrderBillItemEntity.fromJson(e))
        .toList();
    billNoMeasureFee = JsonKit.asList(json["no_mea"])
        .map((e) => PreOrderBillItemEntity.fromJson(e))
        .toList();
    measureOrderBill = JsonKit.asList(json["measure"])
        .map((e) => PreOrderBillItemEntity.fromJson(e))
        .toList();
  }
}

class PreOrderBillItemEntity {
  late String label;
  late String hint;
  late PreOrderBillItemValueEntity value;

  PreOrderBillItemEntity.fromJson(Map json) {
    label = json["name"];
    hint = json["message"];
    value = PreOrderBillItemValueEntity.fromJson(json["money"]);
  }
}

class PreOrderBillItemValueEntity {
  late String value;
  late bool bold;
  late bool highlighted;

  PreOrderBillItemValueEntity.fromJson(Map json) {
    value = json["value"];
    bold = JsonKit.asBool(json["bold"]);
    highlighted = json["color"] == 3;
  }
}
