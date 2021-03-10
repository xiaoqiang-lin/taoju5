/*
 * @Description: 订单详情数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:26:35
 * @LastEditTime: 2021-01-15 13:49:18
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/domain/model/order/refund_status.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:taoju5/utils/x_logger.dart';

import 'order_detail_product_model.dart';

class OrderDetailModelWrapper {
  OrderDetailModel orderDetailModel;
  OrderDetailModelWrapper.fromJson(Map json) {
    orderDetailModel = OrderDetailModel.fromJson(json['order']);
  }
}

class OrderDetailModel {
  int id;
  String no;
  int typeCode;
  int orderStatusCode;
  int productTypeCode;
  int refundStatusCode;
  String title;
  String description;
  String receiverName;
  String receiverAddress;
  String receiverTel;

  String measureTime;
  String actualMeasureTime;
  String installTime;
  String actualInstallTime;
  bool isMeasureTimeChanged;
  bool isInstallTimeChanged;

  List<OrderDetailProductModel> productList;

  String note;

  String createTime;
  String username;
  String customerName;
  String shopName;

  String deposit;
  String balance;
  String payAmount;
  String originalPrice;

  String deltaPrice;
  String modifyPriceNote;

  String station;
  String arriveAt;

  List<String> manualscriptPictureList;

  OrderDetailModel.fromJson(Map json) {
    id = json['order_id'];
    no = json['order_no'];
    title = json["order_title"];
    description = json["order_desc"];
    typeCode = json['order_type'];
    orderStatusCode = json['order_status'];
    refundStatusCode = json["refund_status"];
    receiverAddress = json['address'];
    receiverTel = json['receiver_mobile'];
    receiverName = json['receiver_name'];
    deposit = json['order_earnest_money'];
    installTime = json["install_time"];
    measureTime = json["measure_time"];
    username = json["user_name"];
    customerName = json["client_name"];
    deltaPrice = json["adjust_money"];
    originalPrice = json["order_estimated_price"];
    modifyPriceNote = json["adjust_money_remark"];
    shopName = json["shop_name"];
    balance = json["tail_money"];
    payAmount = json["reality_pay_money"];

    createTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json["create_time"]));
    actualInstallTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json["reality_install_time"]));
    actualMeasureTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json["reality_measure_time"]));

    isMeasureTimeChanged = JsonKit.asBool(json["measure_adjustment"]);

    isInstallTimeChanged = JsonKit.asBool(json["install_adjustment"]);

    productList = JsonKit.asList(json["order_goods"])
        .map((e) => OrderDetailProductModel.fromJson(e))
        .cast<OrderDetailProductModel>()
        .toList();

    station = json["AcceptStation"];
    arriveAt = json["AcceptTime"];

    manualscriptPictureList =
        JsonKit.asList(json["measure_manuscripts_picture"])
            .map((e) => JsonKit.asWebUrl(e))
            .toList();
  }
}

extension OrderDetailModelKit on OrderDetailModel {
  OrderStatus get orderStatus => getOrderStaus(orderStatusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
  BaseProductType get productType => getProductType(productTypeCode);

  RefundStatus get refundStatus {
    if (productList.any((e) => e.refundStatus == RefundStatus.refundable))
      return RefundStatus.refundable;
    return RefundStatus.toBeAuthed;
  }

  bool get canRefund => refundStatus == RefundStatus.refundable;

  String get receiverNameAttr => receiverName.length > 12
      ? receiverName.substring(0, 7) +
          "..." +
          receiverName.substring(receiverName.length - 3)
      : receiverName;

  set refundStatus(RefundStatus status) {
    Map<RefundStatus, int> map = {
      RefundStatus.refundable: 0,
      RefundStatus.toBeAuthed: 1
    };
    productList.forEach((e) {
      e.refundStatusCode = map[status];
    });
  }

  bool get canCancel =>
      orderStatus != OrderStatus.canceled &&
      orderStatus < OrderStatus.producing;

  bool get isPriceModified => !GetUtils.isNullOrBlank(deltaPrice);

  bool get isAllProductCanceled => GetUtils.isNullOrBlank(productList)
      ? true
      : productList.any((e) => e.refundStatus != RefundStatus.refundable);
}

class OrderMeasureDataModel {
  int id;
  int orderId;
  int productId;
  int orderProductId;
  String note;
  String picture;
  String room;
  String windowType;
  String windowPattern;
  String width;
  String height;
  String widthNote;
  String heightNote;
  String installMode;
  String openMode;
  String newOpenMode;
  String installationSurfaceMaterial;
  String plasterLine;

  String frameWidth;
  String boxSize;
  String plasterLineHeight;

  String newDeltaY;
  String deltaY;

  List<String> pictures;

  OrderMeasureDataModel.fromJson(Map json) {
    XLogger.v(json);
    id = json["id"];
    orderId = json["order_id"];
    productId = json["goods_id"];
    orderProductId = json["order_goods_id"];
    note = json["remark"];
    room = json["install_room"];
    windowType = json["window_measure_type"];
    windowPattern = json["window_type"];
    pictures = '${json["picture"]}'
        .split(",")
        .map((e) => JsonKit.asWebUrl(e))
        .toList();
    installMode = json["install_type"];
    openMode = json["open_type"];
    width = "${json["width"]}";
    widthNote = json["width_explain"];
    height = "${json["height"]}";
    heightNote = json["height_explain"];
    installationSurfaceMaterial = json["install_face_materials"];
    plasterLine =
        JsonKit.asString(json['plaster_line'], trueDesc: "有", falseDesc: "没有");
    frameWidth = json["frame_width"];
    boxSize = json["curtain_box_size"];
    plasterLineHeight = json["top_height"];
    deltaY = json["vertical_ground_height"];
  }
}

extension OrderMeasureDataModelKit on OrderMeasureDataModel {
  String get openModeName =>
      RegExp(".*[a-zA-Z]+.*").hasMatch(openMode) ? "分墙面打开" : openMode;
}
