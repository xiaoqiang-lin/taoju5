import 'package:taoju5/xdio/x_dio.dart';

class DashboardAPI {
  Future<BaseResponse> passengerFlow({Map params}) =>
      XDio().get("/api/order/analysis1", params: params);

  Future<BaseResponse> salesStatistics({Map params}) =>
      XDio().get("/api/order/analysis2", params: params);

  Future<BaseResponse> salesAnalysis({Map params}) =>
      XDio().get("/api/order/analysis3", params: params);
}
