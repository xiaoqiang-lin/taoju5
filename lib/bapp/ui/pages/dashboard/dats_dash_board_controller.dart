/*
 * @Description: 数据中心控制器
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:27:55
 * @LastEditTime: 2021-01-07 13:18:33
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataDashBoardController extends GetxController
    with SingleGetTickerProviderMixin {
  List<String> tabList = ["客流统计", "销售统计", "销售分析"];

  List<String> timeList = ["本周", "本月", "本季度", "本年", "更多"];

  TabController tabController1;
  TabController tabController2;

  bool showMore = false;

  @override
  void onInit() {
    tabController1 = TabController(length: tabList.length, vsync: this);
    tabController2 = TabController(length: timeList.length, vsync: this);
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
