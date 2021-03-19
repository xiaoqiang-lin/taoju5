import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/dashboard/sales_statistics_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/sales_statistics/sales_statistics_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/widget/x_graph_title.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';

class SalesStatisticsGraph extends StatelessWidget {
  const SalesStatisticsGraph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalesStatisticsController>(
      autoRemove: false,
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: BDimens.gap16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (SalesAmountModel item in _.statistics.amountList)
                        Column(
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(fontSize: BDimens.sp28),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: BDimens.gap20),
                                child: Text(
                                  "${item.value.toStringAsFixed(2)}万元",
                                  style: TextStyle(
                                      color: BColors.pinkColor,
                                      fontSize: BDimens.sp24),
                                ))
                          ],
                        )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap32),
                    child: XGraphTitle(title: "各类目销量数据")),
                Container(
                  height: 216,
                  child: SfCartesianChart(
                    primaryYAxis: NumericAxis(
                        isVisible: true,
                        desiredIntervals: 8,
                        maximum: 100000,
                        minimum: 0),
                    primaryXAxis: CategoryAxis(
                        isVisible: true,
                        desiredIntervals: 5,
                        majorGridLines:
                            MajorGridLines(color: Colors.transparent, width: 0),
                        minorTickLines: MinorTickLines(
                            size: 1, color: Colors.transparent, width: 0),
                        majorTickLines: MajorTickLines(
                            size: 3, color: Colors.transparent, width: 0),
                        axisLine: AxisLine(width: 0, color: Colors.transparent),
                        minorGridLines:
                            MinorGridLines(width: 0, color: Colors.transparent),
                        labelStyle: TextStyle(fontSize: BDimens.sp20),
                        tickPosition: TickPosition.inside,
                        labelPosition: ChartDataLabelPosition.outside),
                    series: _.barChartSeries,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap32),
                    child: XGraphTitle(title: "近一年销售分析")),
                Container(
                  margin: EdgeInsets.only(top: BDimens.gap8),
                  child: Text(
                    "-销售员:${Get.find<UserProviderController>()?.user?.nickName ?? ""}",
                    style: TextStyle(
                        fontSize: BDimens.sp20, color: BColors.greyTextColor),
                  ),
                ),
                Container(
                  height: 216,
                  child: SfCartesianChart(
                    primaryYAxis: NumericAxis(
                        minimum: 0,
                        isVisible: true,
                        desiredIntervals: 8,
                        maximum: 80000),
                    primaryXAxis: CategoryAxis(
                        isVisible: true,
                        majorGridLines:
                            MajorGridLines(color: Colors.transparent, width: 0),
                        minorTickLines: MinorTickLines(
                            size: 1, color: Colors.transparent, width: 0),
                        majorTickLines: MajorTickLines(
                            size: 3, color: Colors.transparent, width: 0),
                        axisLine: AxisLine(width: 0, color: Colors.transparent),
                        minorGridLines:
                            MinorGridLines(width: 0, color: Colors.transparent),
                        labelStyle: TextStyle(fontSize: BDimens.sp20),
                        tickPosition: TickPosition.inside,
                        labelPosition: ChartDataLabelPosition.outside),
                    series: _.lineChartSeries,
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
