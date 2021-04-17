/*
 * @Description: 数据中心控制器
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:27:55
 * @LastEditTime: 2021-01-07 13:18:33
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/ui/modal/dashboard/select_date_modal.dart';
import 'package:taoju5_b/ui/modal/dashboard/select_date_modal_controller.dart';
import 'package:taoju5_b/ui/pages/dashboard/fragment/passenger_flow/passsenger_flow_controller.dart';
import 'package:taoju5_b/ui/pages/dashboard/fragment/sales_analysis/sales_analysis_controller.dart';
import 'package:taoju5_b/ui/pages/dashboard/fragment/sales_statistics/sales_statistics_controller.dart';

enum DateOption { week, month, quarter, year, more, other }

extension DateOptionKit on DateOption {
  int get type => index + 1;
}

class DashboardParamsModel {
  DateOption option;
  String date;

  DashboardParamsModel({@required this.option, this.date = ""});
  Map get params => {"type": option.type, "date": date};
}

class DashboardDateOption {
  DateOption date;
  String text;

  DashboardDateOption({@required this.date, @required this.text});
}

class DataDashBoardController extends GetxController
    with SingleGetTickerProviderMixin {
  List<String> tabList = ["客流统计", "销售统计", "销售分析"];

  DateOption dateOption = DateOption.week;

  String date = "";

  String title = "--:--";

  void updateTitle(String str) {
    title = str;
    update(["title"]);
  }

  List<DashboardDateOption> dateOptionList = [
    DashboardDateOption(date: DateOption.week, text: "本周"),
    DashboardDateOption(date: DateOption.month, text: "本月"),
    DashboardDateOption(date: DateOption.quarter, text: "本季"),
    DashboardDateOption(date: DateOption.year, text: "本年")
  ];

  DashboardParamsModel get args =>
      DashboardParamsModel(option: dateOption, date: date);

  void selectDateOption(DateOption option) {
    if (dateOption == option) return;
    dateOption = option;
    update();
    refreshData();
  }

  refreshData() {
    if (Get.isRegistered<PassengerFlowController>()) {
      Get.find<PassengerFlowController>().loadData(params: args.params);
    }

    if (Get.isRegistered<SalesAnalysisController>()) {
      Get.find<SalesAnalysisController>().loadData(params: args.params);
    }
    if (Get.isRegistered<SalesStatisticsController>()) {
      Get.find<SalesStatisticsController>().loadData(params: args.params);
    }
  }

  Future openSelectDateModal() {
    return showSelectDateModal().then((value) {
      if (value != null && value is Map) {
        var year = value["year"];
        var month = value["month"];
        SelectDateMode mode = value["mode"];
        dateOption =
            mode == SelectDateMode.byYear ? DateOption.other : DateOption.more;
        date = mode == SelectDateMode.byYear ? "$year" : "$year-$month";
        return args;
      }
    }).then((_) {
      refreshData();
    });
  }

  TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabList.length, vsync: this);
    // tabController2 = TabController(length: timeList.length, vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}
