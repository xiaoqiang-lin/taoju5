/*
 * @Description: 数据看板
 * @Author: iamsmiling
 * @Date: 2021-03-16 15:09:13
 * @LastEditTime: 2021-04-17 17:29:36
 */
import 'package:taoju5_b/xdio/x_dio.dart';

class DashboardAPI {
  Future<BaseResponse> passengerFlow({Map params}) =>
      XDio().get("/api/order/analysis1", params: params);

  Future<BaseResponse> salesStatistics({Map params}) =>
      XDio().get("/api/order/analysis2", params: params);

  Future<BaseResponse> salesAnalysis({Map params}) =>
      XDio().get("/api/order/analysis3", params: params);
}
