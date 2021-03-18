/*
 * @Description: 数据中心控制器
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:27:55
 * @LastEditTime: 2021-01-07 13:18:33
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DateOption { week, month, quarter, year, more }

extension DateOptionKit on DateOption {
  int get type => index + 1;
}

class DashboardParamsModel {
  DateOption date;
  String start;
  String end;
  Map get params => {"type": date.type, "start": start, "end": end};
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

  List<DashboardDateOption> dateOptionList = [
    DashboardDateOption(date: DateOption.week, text: "本周"),
    DashboardDateOption(date: DateOption.month, text: "本月"),
    DashboardDateOption(date: DateOption.quarter, text: "本季"),
    DashboardDateOption(date: DateOption.year, text: "本年"),
    DashboardDateOption(date: DateOption.more, text: "更多")
  ];

  void selectDateOption(DateOption option) {
    dateOption = option;
    update();
  }

  TabController tabController1;
  TabController tabController2;

  bool showMore = false;

  @override
  void onInit() {
    tabController1 = TabController(length: tabList.length, vsync: this);
    // tabController2 = TabController(length: timeList.length, vsync: this);
    super.onInit();
  }

  selectTime() {
    showCupertinoModalPopup(
        context: Get.context,
        builder: (BuildContext context) {
          return Material(
            child: Container(
              width: Get.width,
              height: .6 * Get.height,
              child: Text("啦啦啦啦"),
            ),
          );
        });
  }

  @override
  void dispose() {
    tabController1?.dispose();
    tabController2.dispose();
    super.dispose();
  }
}
