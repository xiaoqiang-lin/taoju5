/*
 * @Description: 订单相关
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:03:16
 * @LastEditTime: 2021-05-18 09:17:00
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class OrderAPI {
  HttpKit _http = HttpKit();

  Future<BaseEntity> createMeasureOrder(Map params) =>
      _http.post("/app/order/orderMeasureCreate", params: params);

  ///订单列表
  Future<BaseEntity> orderList(Map? params) =>
      _http.get("/app/order/orderList", params: params);

  ///订单列表
  Future<BaseEntity> orderDetail(Map? params) =>
      _http.get("/app/order/orderDetail", params: params);
}
