import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/dashboard/fragment/passenger_flow/passsenger_flow_controller.dart';
import 'package:taoju5_b/ui/pages/dashboard/widget/x_graph_title.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PassengerFlowGraph extends StatelessWidget {
  const PassengerFlowGraph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassengerFlowController>(
      autoRemove: false,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: BDimens.gap32),
            padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                XGraphTitle(title: "自然客流"),
                Container(
                  margin: EdgeInsets.only(
                      top: BDimens.gap32, bottom: BDimens.gap32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return Text(
                        "${_.categoryList[index]}:  ${_.flow == null ? 0 : _.flow.list[index]}",
                        style: TextStyle(fontSize: BDimens.sp26),
                      );
                    }),
                  ),
                ),
                XGraphTitle(title: "转单率"),
                Container(
                  height: 216,
                  child: SfCircularChart(
                    series: _.pieSections,
                  ),
                ),
                XGraphTitle(title: "转单趋势图"),
                Container(
                  height: 216,
                  margin: EdgeInsets.only(top: BDimens.gap32),
                  child: SfCartesianChart(
                    primaryYAxis: NumericAxis(
                        axisLine: AxisLine(width: .5),
                        desiredIntervals: 10,
                        minimum: 0,
                        maximum: 1000,
                        isVisible: true),
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
