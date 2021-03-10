/*
 * @Description: 商品列表模型
 * @Author: iamsmiling
 * @Date: 2020-12-22 13:47:52
 * @LastEditTime: 2021-01-13 13:47:10
 */
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/utils/json_kit.dart';

import 'order_type.dart';

class OrderModelListWrapper {
  List<OrderModel> orderModelList;
  List<int> countList;
  OrderModelListWrapper.fromJson(Map json) {
    orderModelList = JsonKit.asList(json["data"])
        .map((e) => OrderModel.fromJson(e))
        .toList();
    countList = JsonKit.asList((json["statusNum"].values)).cast<int>();
  }
}

class OrderModel {
  int id;
  String no;

  ///[typeCode]1是普通单  2是测量单
  int typeCode;
  int statusCode;
  String receiverName;
  String createTime;

  ///[prepayment]押金
  double prepayment;

  ///[balance]尾款
  double balance;

  ///[estimationAmount]预估价
  double estimationAmount;

  ///[windowCount]窗户数量
  String windowCount;
  int customerId;
  String measureTime;
  String installTime;
  String typeName;

  String customerName;

  String image;

  List<OrderProductModel> productList;

  OrderModel.fromJson(Map json) {
    id = json['order_id'];
    no = json['order_no'];
    typeCode = json['order_type'];
    statusCode = json['order_status'];
    receiverName = json['receiver_name'];
    createTime = JsonKit.formatDateTime(
        JsonKit.getDateTimeFromMillseconds(json['create_time']),
        format: "yyyy-MM-dd HH:mm:ss");
    prepayment = JsonKit.asDouble(json['order_earnest_money']);
    balance = JsonKit.asDouble(json['tail_money']);
    estimationAmount = JsonKit.asDouble(json['order_estimated_price']);
    windowCount = "${json['order_window_num']}";
    customerId = json['client_id'];
    measureTime = json['measure_time'];
    installTime = json['install_time'];
    typeName = json['order_type_name'];
    customerName = json['client_name'];

    productList = JsonKit.asList(json["order_item_list"])
        .map((e) => OrderProductModel.fromJsom(e))
        .toList();
  }
}

extension OrderModelKit on OrderModel {
  OrderStatus get orderStatus => getOrderStaus(statusCode);
  OrderType get orderType => getOrderType(typeCode, orderStatus);
}

class OrderProductModel {
  String name;
  double price;

  ///[hasSelected] 是否已经选品
  bool hasSelected;
  int orderStatusCode;
  String statusName;
  double width;
  double height;
  String image;

  String unit;

  String room;

  OrderProductModel.fromJsom(Map json) {
    name = json['goods_name'];
    statusName = json['status_name'];
    price = JsonKit.asDouble(json['price']);
    room =
        JsonKit.getValueInComplexMap(json, ["wc_attr", "1", "name"]).toString();
    hasSelected = JsonKit.asBool(json['is_selected_goods']);
    image = JsonKit.asWebUrl(
        JsonKit.getValueInComplexMap(json, ["picture", "pic_cover_small"]));
    List list =
        JsonKit.asList(JsonKit.getValueInComplexMap(json, ["wc_attr", "9"]));
    width = JsonKit.isNullOrBlank(list)
        ? 0.0
        : JsonKit.asDouble(JsonKit.getValueByKey(list?.first, "value"));
    height = JsonKit.isNullOrBlank(list)
        ? 0.0
        : JsonKit.asDouble(JsonKit.getValueByKey(list?.last, "value"));
  }
}
