/*
 * @Description: 订单相关
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:02:45
 * @LastEditTime: 2021-05-07 16:06:03
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/provider/order_api.dart';

class OrderRepository {
  OrderAPI _api = OrderAPI();
  Future<BaseEntity> createMeasureOrder(Map params) =>
      _api.createMeasureOrder(params);
}
