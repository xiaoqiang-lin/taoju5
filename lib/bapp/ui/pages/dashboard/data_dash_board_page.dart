/*
 * @Description: 数据中心
 * @Author: iamsmiling
 * @Date: 2021-01-07 10:25:03
 * @LastEditTime: 2021-01-07 13:18:56
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/dats_dash_board_controller.dart';

class DataDashBoardPage extends GetView<DataDashBoardController> {
  const DataDashBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据中心"),
        bottom: PreferredSize(
            child: Column(
              children: [
                TabBar(
                  controller: controller.tabController1,
                  tabs: [for (String tab in controller.tabList) Text(tab)],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TabBar(
                      onTap: (_) {
                        controller.showMore = false;
                        controller.update(["more"]);
                      },
                      controller: controller.tabController2,
                      tabs: [for (String tab in controller.timeList) Text(tab)],
                    )),
                    // GestureDetector(
                    //   onTap: () {
                    //     controller.showMore = true;
                    //     controller.update(["more"]);
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.only(bottom: 12.0),
                    //     child: Text("更多"),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(72)),
      ),
      body: GetBuilder<DataDashBoardController>(
        id: "more",
        builder: (_) {
          return IndexedStack(
            index: _.showMore ? 1 : 0,
            children: [
              TabBarView(
                controller: controller.tabController1,
                children: [
                  for (String _ in controller.tabList)
                    TabBarView(
                        controller: controller.tabController2,
                        children: [
                          for (String tab in controller.timeList) Text(tab)
                        ])
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
