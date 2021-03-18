/*
 * @Description: 数据看版
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:28:42
 * @LastEditTime: 2021-01-07 10:32:10
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/dats_dash_board_controller.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/passenger_flow/passsenger_flow_controller.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/sales_analysis/sales_analysis_controller.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/sales_statistics/sales_statistics_controller.dart';

class DataDashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataDashBoardController());

    Get.lazyPut(() => PassengerFlowController());

    Get.lazyPut(() => SalesStatisticsController());

    Get.lazyPut(() => SalesAnalysisController());
  }
}
