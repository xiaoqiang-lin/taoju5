/*
 * @Description: 订单详情商品
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:51:04
 * @LastEditTime: 2021-01-15 13:56:49
 */
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/domain/model/order/refund_status.dart';
import 'package:taoju5/utils/json_kit.dart';

import 'order_detail_model.dart';

class OrderDetailProductModel {
  int id;
  int orderId;
  int prodcutId;
  String name;
  String image;
  String description;
  String price;
  String totalPrice;
  String orderStatusName;
  int typeCode;
  int orderStatusCode;

  int refundStatusCode;

  bool hasSelected;
  OrderMeasureDataModel measureData;

  OrderDetailProductModel.fromJson(Map json) {
    id = json["order_goods_id"];
    orderId = json["order_id"];
    name = json["goods_name"];
    prodcutId = json["goods_id"];
    price = json["price"];
    typeCode = json["order_type"];
    orderStatusCode = json["order_status"];
    refundStatusCode = json["refund_status"];
    image = JsonKit.asWebUrl(
        JsonKit.getValueInComplexMap(json, ["picture_info", "pic_cover"]));
    description = json["goods_attr_str"];
    totalPrice = json["estimated_price"];
    hasSelected = JsonKit.asBool(json["is_selected_goods"]);
    orderStatusName = json["status_name"];

    measureData =
        OrderMeasureDataModel.fromJson(json["order_goods_measure"] ?? {});
  }
}

extension OrderDetailProductModelKit on OrderDetailProductModel {
  OrderStatus get orderStatus => getOrderStaus(orderStatusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
  RefundStatus get refundStatus => getRefundStatus(refundStatusCode);

  bool get canCancel =>
      (orderStatus != OrderStatus.canceled &&
          orderStatus < OrderStatus.producing) &&
      //如果已经拒绝取消,则可以重新发起取消
      canRefund;

  bool get isCanceling => refundStatus == RefundStatus.toBeAuthed;

  bool get canSelect => orderType != OrderType.measureOrder
      ? false
      : orderStatus == OrderStatus.toBeSelected;

  bool get canRefund => [
        RefundStatus.refundable,
        RefundStatus.failed,
      ].contains(refundStatus);

  set refundStatus(RefundStatus status) {
    Map<RefundStatus, int> map = {
      RefundStatus.refundable: 0,
      RefundStatus.toBeAuthed: 1
    };
    this.refundStatusCode = map[status];
  }
}
