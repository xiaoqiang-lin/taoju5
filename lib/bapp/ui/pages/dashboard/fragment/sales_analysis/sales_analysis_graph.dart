import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/sales_analysis/sales_analysis_controller.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/widget/x_graph_title.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesAnalysisGraph extends StatelessWidget {
  const SalesAnalysisGraph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesAnalysisController>(
      autoRemove: false,
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: BDimens.gap32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            XGraphTitle(title: "性别"),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 216,
                              child: SfCircularChart(
                                borderWidth: 3,
                                series: _.genderPieChartSeries,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            XGraphTitle(title: "年龄段"),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 216,
                              child: SfCircularChart(
                                series: _.agePieChartSeries,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap32),
                    child: XGraphTitle(title: "偏好风格")),
                Container(
                  height: 216,
                  child: SfCartesianChart(
                    primaryYAxis: NumericAxis(isVisible: true),
                    primaryXAxis: CategoryAxis(
                        rangePadding: ChartRangePadding.round,
                        isVisible: true,
                        majorGridLines:
                            MajorGridLines(color: Colors.transparent, width: 0),
                        axisLine: AxisLine(width: 0, color: Colors.transparent),
                        minorGridLines:
                            MinorGridLines(width: 0, color: Colors.transparent),
                        labelStyle: TextStyle(fontSize: BDimens.sp20),
                        tickPosition: TickPosition.outside,
                        labelPosition: ChartDataLabelPosition.outside),
                    series: _.barChartSeries,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
