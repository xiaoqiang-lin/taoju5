/*
 * @Description: 物流页面
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:22:40
 * @LastEditTime: 2021-05-28 18:00:30
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';

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
            return ListView.builder(
              itemBuilder: (BuildContext context, int i) {
                return PackageLogisticsCard(package: _.packets[i]);
              },
              itemCount: _.packets.length,
            );
          }),
    );
  }
}
