/*
 * @Description: 物流页面
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:22:40
 * @LastEditTime: 2021-06-21 11:03:18
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';

import 'logistics_controller.dart';
import 'widget/package_logistics_card.dart';

class LogisticsPage extends GetView<LogisticsController> {
  const LogisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查看物流"),
      ),
      body: FutureLoadStateBuilder(
          controller: controller,
          builder: (LogisticsController _) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int i) {
                ///当有多个包裹时 需要显示 查看更多物流信息的按
                return PackageLogisticsCard(
                  package: _.packets[0],
                );
              },
              separatorBuilder: (BuildContext context, int i) {
                return Divider(
                  thickness: R.dimen.dp10,
                  color: R.color.fff5f5f5,
                );
              },
              itemCount: 4,
            );
          }),
    );
  }
}
