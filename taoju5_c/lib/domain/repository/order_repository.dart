/*
 * @Description: 订单相关
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:02:45
 * @LastEditTime: 2021-06-03 17:41:37
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_mainfest_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/domain/provider/order_api.dart';

class OrderRepository {
  OrderAPI _api = OrderAPI();

  Future<PayOrderEntity> createOrder(Map params) =>
      _api.createOrder(params).then((value) {
        if (value.data is String) {
          return AliPayOrderEntity.fromJson(value.data);
        }
        return WxPayOrderEntity.fromJson(value.data);
      });
  Future<PayOrderEntity> createMeasureOrder(Map params) =>
      _api.createMeasureOrder(params).then((value) {
        if (value.data is String) {
          return AliPayOrderEntity.fromJson(value.data);
        }
        return WxPayOrderEntity.fromJson(value.data);
      });

  Future<List<OrderEntity>> orderList(Map? params) =>
      _api.orderList(params).then((BaseEntity response) {
        return JsonKit.asList(response.data["data"])
            .map((e) => OrderEntity.fromJson(e))
            .toList();
      });

  Future<OrderDetailEntity> orderDetail(Map? params) =>
      _api.orderDetail(params).then((value) {
        return OrderDetailEntity.fromJson(value.data);
      });

  Future<OrderMainfestEntity> mainfest(Map? params) =>
      _api.mainfest(params).then((value) {
        return OrderMainfestEntity.fromJson(value.data);
      });

  Future<List<OrderTabEntity>> orderTabList() =>
      _api.orderTabList().then((value) {
        return JsonKit.asList(value.data)
            .map((e) => OrderTabEntity.fromJson(e))
            .toList();
      });
}
