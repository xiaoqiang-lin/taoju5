import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/dashboard/sales_statistics_model.dart';
import 'package:taoju5_b/domain/repository/dashboard/dashboard_repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/ui/pages/dashboard/dats_dash_board_controller.dart';

class SalesStatisticsController extends GetxController {
  DashboardRepository _repository = DashboardRepository();
  SalesStatisticsModel statistics = SalesStatisticsModel.sample();

  Future loadData({Map params = const {"type": 1}}) {
    return _repository
        .salesStatistics(params: params)
        .then((SalesStatisticsModel value) {
      statistics = value;
      Get.find<DataDashBoardController>().updateTitle(statistics.date);
    }).whenComplete(update);
  }

  List<ColumnSeries> get barChartSeries => [
        ColumnSeries<ProductSalesStaticsModel, String>(
            dataSource: statistics.productList,
            width: 0.5,
            spacing: 0.4,
            color: BColors.accentGraphColor,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            xValueMapper: (ProductSalesStaticsModel data, _) => data.name,
            yValueMapper: (ProductSalesStaticsModel data, _) => data.value)
      ];

  List<SplineSeries> get lineChartSeries => [
        SplineSeries<SalesStatisticsYearlyModel, String>(
            dataSource: statistics.data,
            width: 3,
            color: BColors.accentGraphColor,
            markerSettings: MarkerSettings(isVisible: true),
            dataLabelSettings: DataLabelSettings(
                isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
            xValueMapper: (SalesStatisticsYearlyModel data, _) => data.date,
            yValueMapper: (SalesStatisticsYearlyModel data, _) => data.value)
      ];

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
