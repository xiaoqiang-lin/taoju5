/*
 * @Description: 数据中心
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:25:03
 * @LastEditTime: 2021-01-07 13:18:56
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/dats_dash_board_controller.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/passenger_flow/passenger_flow_graph.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/sales_analysis/sales_analysis_graph.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/fragment/sales_statistics/sales_statistics_graph.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_rotation_arrow.dart';

class DataDashBoardPage extends GetView<DataDashBoardController> {
  const DataDashBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("数据中心"),
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [for (String tab in controller.tabList) Text(tab)],
        ),
      ),
      body: Column(
        children: [
          GetBuilder<DataDashBoardController>(builder: (_) {
            return Column(
              children: [
                Container(
                  color: BColors.scaffoldBgColor,
                  child: Row(
                    children: [
                      for (DashboardDateOption date in _.dateOptionList)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _.selectDateOption(date.date),
                            child: Container(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                height: 36,
                                alignment: Alignment.center,
                                color: _.dateOption != date.date
                                    ? BColors.scaffoldBgColor
                                    : Colors.white,
                                child: Text(
                                  date.text,
                                  style: _.dateOption == date.date
                                      ? TextStyle(
                                          fontSize: BDimens.sp26,
                                          color: BColors.textColor,
                                          fontWeight: FontWeight.w500)
                                      : TextStyle(
                                          fontSize: BDimens.sp26,
                                          color: BColors.greyTextColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "更多",
                            style: TextStyle(
                                fontSize: BDimens.sp26,
                                color: BColors.greyTextColor),
                          ),
                          XRotationArrow(
                            onTap: _.openSelectDateModal,
                            child: const Icon(
                              Icons.expand_more,
                              size: 22,
                              color: BColors.greyTextColor,
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                GetBuilder<DataDashBoardController>(
                    id: "title",
                    builder: (_) {
                      return Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: BDimens.gap32, vertical: BDimens.gap16),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: BColors.dividerColor,
                                height: 1,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: BDimens.gap8,
                                    horizontal: BDimens.gap16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: BColors.scaffoldBgColor),
                                    color: BColors.scaffoldBgColor),
                                child: Text(
                                  "${_.title}",
                                  style: TextStyle(fontSize: BDimens.sp28),
                                )),
                            Expanded(
                              child: Container(
                                color: BColors.dividerColor,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ],
            );
          }),
          // Container(),
          Expanded(
            child: GetBuilder<DataDashBoardController>(
              builder: (_) {
                return TabBarView(
                  controller: controller.tabController,
                  children: [
                    PassengerFlowGraph(),
                    SalesStatisticsGraph(),
                    SalesAnalysisGraph()
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
