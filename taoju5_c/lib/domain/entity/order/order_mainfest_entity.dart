/*
 * @Description:商品清单数据模型
 * @Author: iamsmiling
 * @Date: 2021-06-02 14:50:35
 * @LastEditTime: 2021-06-23 10:13:23
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class OrderMainfestEntity {
  late OrderProductMainfestEntity customProduct;
  late OrderProductMainfestEntity finishedProduct;

  String totalPrice = "";

  OrderMainfestEntity.fromJson(Map json) {
    customProduct = OrderProductMainfestEntity.fromJson(json["custom_product"]);
    finishedProduct =
        OrderProductMainfestEntity.fromJson(json["finished_product"]);

    totalPrice = json["total_money"];
  }

  OrderMainfestEntity();
}

class OrderProductMainfestEntity {
  late List<List<OrderProductMainfestItemEntity>> items;

  late List<OrderProductMainfestSheetItemEntity> sheets;

  OrderProductMainfestEntity.fromJson(Map json) {
    items = JsonKit.asList(json["order_goods"])
        .map((e) => JsonKit.asList(e["checklist"])
            .map((o) => OrderProductMainfestItemEntity.fromJson(o))
            .toList())
        .toList();
    sheets = JsonKit.asList(json["money_list"])
        .map((e) => OrderProductMainfestSheetItemEntity.fromJson(e))
        .toList();
  }
}

class OrderProductMainfestItemEntity {
  late String image;

  late String label;
  late String amount;
  late String price;

  late String description;

  OrderProductMainfestItemEntity.fromJson(Map json) {
    image = JsonKit.asWebUrl(json["image"]);
    label = json["goods_name"];
    amount = json["goods_money"];
    price = json["price"];
    description = json["material_name"];
  }
}

class OrderProductMainfestSheetItemEntity {
  late String label;

  late String tip;

  late OrderProductMainfestSheetItemValueEntity value;

  OrderProductMainfestSheetItemEntity.fromJson(Map json) {
    label = json["name"];
    tip = json["message"];
    value = OrderProductMainfestSheetItemValueEntity.fromJson(json["money"]);
  }
}

class OrderProductMainfestSheetItemValueEntity {
  late String value;

  late bool highlighted;

  OrderProductMainfestSheetItemValueEntity.fromJson(Map json) {
    value = json["value"];
    highlighted = JsonKit.asBool(json["color"]);
  }
}
