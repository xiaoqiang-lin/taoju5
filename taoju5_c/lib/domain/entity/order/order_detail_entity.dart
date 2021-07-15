/*
 * @Description: 订单详情数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-18 09:27:53
 * @LastEditTime: 2021-07-12 17:24:33
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';

class OrderDetailEntity {
  late int id;
  late double amount;
  late OrderStatusTipEntity statusTip;
  late OrderReceiverEntity receiver;
  late OrderSheetEnity sheet;
  late OrderManuscriptEntity manuscript;

  late List<OrderActionLogEntity> logs;
  late OrderProductListWrapper wrapper;
  late List<OrderBillEntity> bills;
  late List<OrderActionButtonEntity> actions;

  late CancelOrderReasonEntity cancelOrderReason;

  List<OrderProductEntity> get products =>
      [...wrapper.customProduct.products, ...wrapper.finishedProduct.products];

  String reason = "";

  String cancelOrderMessage = "";

  OrderDetailEntity.fromJson(Map json) {
    id = json["order_id"];
    amount = JsonKit.asDouble("${json["pay_money"]}");
    actions = JsonKit.asList(json["button"])
        .map((e) => OrderActionButtonEntity.fromJson(e))
        .toList();
    statusTip = OrderStatusTipEntity.fromJson(json["title_detail"]);
    receiver = OrderReceiverEntity.fromJson(json["receiver_detail"]);
    sheet = OrderSheetEnity.fromJson(json["order_message"]);
    manuscript =
        OrderManuscriptEntity.fronJson(JsonKit.asMap(json["manuscripts"]));

    wrapper = OrderProductListWrapper.fromJson(json["order_goods"]);
    logs = JsonKit.asList(json["mes_int_detail"])
        .map((e) => OrderActionLogEntity.fromJson(e))
        .toList();
    bills = JsonKit.asList(json["money_list"])
        .map((e) => OrderBillEntity.fromJson(e))
        .toList();

    cancelOrderReason = CancelOrderReasonEntity.fromJson(json["reason"]);
    cancelOrderMessage = json["refund_hint"];
  }
}

class OrderProductListWrapper {
  String status = "";
  late OrderProductWrapperEntity customProduct;

  late OrderProductWrapperEntity finishedProduct;

  late List<OrderBillEntity> bills;

  late String tip;

  OrderProductListWrapper.fromJson(Map json) {
    customProduct = OrderProductWrapperEntity.fromJson(json["custom_product"]);
    finishedProduct =
        OrderProductWrapperEntity.fromJson(json["finished_product"]);
    bills = JsonKit.asList(json["order_money"])
        .map((e) => OrderBillEntity.fromJson(e))
        .toList();

    tip = json["checklist"];
  }
}

class OrderProductWrapperEntity {
  late List<OrderProductEntity> products;
  late List<OrderBillEntity> bills;

  OrderProductWrapperEntity.fromJson(Map json) {
    products = JsonKit.asList(json["order_goods"])
        .map((e) => OrderProductEntity.fromJson(e))
        .toList();

    bills = JsonKit.asList(json["money_list"])
        .map((e) => OrderBillEntity.fromJson(e))
        .toList();
  }
}

class OrderProductEntity {
  late ProductAdaptorEntity product;
  String actions = "";
  String status = "";
  late bool selected = false;
  OrderProductEntity.fromJson(Map json) {
    product = ProductAdaptorEntity.fromJson(json);
  }
}

class OrderBillEntity {
  late String label;
  late String hint;
  late OrderBillAmountEntity amount;

  OrderBillEntity.fromJson(Map json) {
    label = json["name"];
    hint = json["message"];
    amount = OrderBillAmountEntity.fromJson(json["money"]);
  }
}

class OrderBillAmountEntity {
  late String value;
  late bool highlighted;
  late bool bold;

  OrderBillAmountEntity.fromJson(Map json) {
    value = JsonKit.asDouble(json["value"]).toStringAsFixed(2);
    highlighted = JsonKit.asBool(json["color"]);
    bold = JsonKit.asBool(json["bold"]);
  }
}

class OrderStatusTipEntity {
  late String title;
  late String description;
  OrderStatusTipEntity.fromJson(Map json) {
    title = json["title_name"];
    description = json["title_desc"];
  }
}

class OrderReceiverEntity {
  late String name;
  late String telephone;
  late String address;

  OrderReceiverEntity.fromJson(Map json) {
    name = json["receiver_name"];
    telephone = json["receiver_mobile"];
    address = json["receiver_address"];
  }
}

class OrderActionLogEntity {
  late String label;
  late String date;
  late bool hasModified;

  OrderActionLogEntity.fromJson(Map json) {
    label = json["name"];
    date = json["value"];
    hasModified = JsonKit.asBool(json["is_adjust"]);
  }
}

class OrderManuscriptEntity {
  late String title;
  late List<PictureEntity> pictures;
  late bool enlarge;

  OrderManuscriptEntity.fronJson(Map json) {
    title = json["name"];
    enlarge = JsonKit.asBool(json["is_magnify"]);
    pictures = JsonKit.asList(json["items"])
        .map((e) => PictureEntity.fromJson(e))
        .toList();
  }
}

class OrderSheetEnity {
  late String title;
  late List<OrderSheetItemEntity> items;

  OrderSheetEnity.fromJson(Map json) {
    title = json["name"];
    items = JsonKit.asList(json["items"])
        .map((e) => OrderSheetItemEntity.fromJson(e))
        .toList();
  }
}

class OrderSheetItemEntity {
  late String key;
  late String value;
  late bool canCopy;

  OrderSheetItemEntity.fromJson(Map json) {
    key = json["name"];
    value = json["value"];
    canCopy = JsonKit.asBool(json["is_copy"]);
  }
}

class CancelOrderReasonEntity {
  late String title;
  late String message;
  late List<String> options;

  CancelOrderReasonEntity.fromJson(Map json) {
    title = json["name"];
    message = json["message"];
    options = JsonKit.asList(json["items"]).cast<String>();
  }
}
