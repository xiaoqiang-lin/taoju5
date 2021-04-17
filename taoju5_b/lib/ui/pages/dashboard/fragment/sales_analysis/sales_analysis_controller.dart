import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/dashboard/sales_analysis_model.dart';
import 'package:taoju5_b/domain/repository/dashboard/dashboard_repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/dashboard/dats_dash_board_controller.dart';

class SalesAnalysisController extends GetxController {
  DashboardRepository _repository = DashboardRepository();
  SalesAnalysisModel analysis = SalesAnalysisModel.sample();
  Future loadData({Map params = const {"type": 1}}) {
    return _repository
        .salesAnalysis(params: params)
        .then((SalesAnalysisModel value) {
      analysis = value;
      Get.find<DataDashBoardController>().updateTitle(analysis.date);
    }).whenComplete(update);
  }

  List<ColumnSeries> get barChartSeries => [
        ColumnSeries<CustomerProductStylePreferenceAnalysisModel, String>(
            dataSource: analysis.styleData,
            color: BColors.accentGraphColor,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            xValueMapper:
                (CustomerProductStylePreferenceAnalysisModel data, _) =>
                    data.style,
            yValueMapper:
                (CustomerProductStylePreferenceAnalysisModel data, _) =>
                    data.value)
      ];

  List<PieSeries> get agePieChartSeries => [
        PieSeries<CustomerAgeAnalysisModel, String>(
          dataSource: analysis.ageData,
          xValueMapper: (CustomerAgeAnalysisModel data, _) => data.name,
          yValueMapper: (CustomerAgeAnalysisModel data, _) => data.value,
          pointColorMapper: (CustomerAgeAnalysisModel data, _) => data.color,
          dataLabelMapper: (CustomerAgeAnalysisModel data, _) =>
              "${data.description}",
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle:
                  TextStyle(fontSize: BDimens.sp20, color: BColors.whiteColor)),
        )
      ];

  List<PieSeries> get genderPieChartSeries => [
        PieSeries<CustomerGenderAnalysisModel, String>(
          dataSource: analysis.genderData,
          xValueMapper: (CustomerGenderAnalysisModel data, _) =>
              data.description,
          yValueMapper: (CustomerGenderAnalysisModel data, _) => data.value,
          dataLabelMapper: (CustomerGenderAnalysisModel data, _) =>
              "${data.description}",
          pointColorMapper: (CustomerGenderAnalysisModel data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle:
                  TextStyle(fontSize: BDimens.sp20, color: BColors.whiteColor)),
        )
      ];

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
