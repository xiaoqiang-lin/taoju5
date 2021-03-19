import 'package:taoju5/bapp/domain/model/dashboard/passenger_flow_model.dart';
import 'package:taoju5/bapp/domain/model/dashboard/sales_analysis_model.dart';
import 'package:taoju5/bapp/domain/model/dashboard/sales_statistics_model.dart';
import 'package:taoju5/bapp/domain/provider/dashboard/dashboard_api.dart';

import 'package:taoju5/xdio/x_dio.dart';

class DashboardRepository {
  DashboardAPI _api = DashboardAPI();

  Future<PassengerFlowModel> passengerFlow({Map params}) =>
      _api.passengerFlow(params: params).then((BaseResponse response) {
        return PassengerFlowModel.fromJson(response.data);
      });

  Future<SalesStatisticsModel> salesStatistics({Map params}) =>
      _api.salesStatistics(params: params).then((BaseResponse response) {
        return SalesStatisticsModel.fromJson(response.data);
      });

  Future<SalesAnalysisModel> salesAnalysis({Map params}) =>
      _api.salesAnalysis(params: params).then((BaseResponse response) {
        return SalesAnalysisModel.fromJson(response.data);
      });
}
