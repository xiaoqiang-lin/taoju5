/*
 * @Description: 订单相关
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:02:45
 * @LastEditTime: 2021-05-18 10:30:39
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/provider/order_api.dart';

class OrderRepository {
  OrderAPI _api = OrderAPI();
  Future<BaseEntity> createMeasureOrder(Map params) =>
      _api.createMeasureOrder(params);

  Future<OrderListWrapperEntity> orderList(Map? params) =>
      _api.orderList(params).then((BaseEntity response) {
        return OrderListWrapperEntity.fromJson(response.data);
      });

  Future<OrderDetailEntity> orderDetail(Map? params) =>
      _api.orderDetail(params).then((value) {
        return OrderDetailEntity.fromJson(value.data);
      });
}
