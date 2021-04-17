import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/dashboard/passenger_flow_model.dart';
import 'package:taoju5_b/domain/repository/dashboard/dashboard_repository.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/dashboard/dats_dash_board_controller.dart';

class PassengerFlowPieChartSection {
  final String title;
  final double value;
  final Color color;
  final String rate;
  final String description;
  PassengerFlowPieChartSection(
      {this.description, this.title, this.value, this.color, this.rate});
}

class PassengerFlowController extends GetxController {
  DashboardRepository _repository = DashboardRepository();

  List<String> categoryList = ["初谈", "意向", "跟进", "成交"];

  TooltipBehavior tooltipBehavior;

  // List<PassengerFlowPieChartSection> get pieChartDataSource => [
  //       PassengerFlowPieChartSection(
  //           title: "暂无数据",
  //           value: 100,
  //           color: BColors.graphColor,
  //           rate: "0%",
  //           description: "暂无数据"),
  //     ];

  List<SplineSeries> get lineChartSeries => [
        SplineSeries<PassengerDailyFlowModel, String>(
            dataSource: flow.data,
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.outer,
                labelPosition: ChartDataLabelPosition.outside,
                textStyle: TextStyle(
                    color: BColors.textColor, fontSize: BDimens.sp20)),
            splineType: SplineType.natural,
            dataLabelMapper: (PassengerDailyFlowModel data, _) =>
                "${data.value}",
            markerSettings:
                MarkerSettings(isVisible: true, shape: DataMarkerType.circle),
            pointColorMapper: (PassengerDailyFlowModel data, _) =>
                BColors.accentGraphColor,
            xValueMapper: (PassengerDailyFlowModel data, _) => data.date,
            yValueMapper: (PassengerDailyFlowModel data, _) => data.value)
      ];

  List<CircularSeries> get pieSections => [
        PieSeries<PassengerTurnoverRateModel, String>(
          dataSource: flow.rateData,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle:
                  TextStyle(fontSize: BDimens.sp20, color: BColors.whiteColor)),
          dataLabelMapper: (PassengerTurnoverRateModel data, _) =>
              data.description,
          pointColorMapper: (PassengerTurnoverRateModel data, _) => data.color,
          xValueMapper: (PassengerTurnoverRateModel data, _) =>
              data.description,
          yValueMapper: (PassengerTurnoverRateModel data, _) => data.value,
        )
      ];

  PassengerFlowModel flow = PassengerFlowModel.sample();

  Future loadData({Map params = const {"type": 1}}) {
    return _repository.passengerFlow(params: params).then((value) {
      flow = value;
      Get.find<DataDashBoardController>().updateTitle(flow.date);
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    tooltipBehavior = TooltipBehavior(
        enable: true,
        borderColor: BColors.accentGraphColor,
        borderWidth: 3,
        color: BColors.accentGraphColor);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
