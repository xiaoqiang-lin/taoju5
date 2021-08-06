/*
 * @Description: app模块
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:01:50
 * @LastEditTime: 2021-07-26 09:18:52
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/home/home_controller.dart';
import 'package:taoju5_b/ui/pages/home/widget/app_module_card.dart';

class HomePageBody extends GetView<BHomeController> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: BDimens.gap24, left: BDimens.gap24, right: BDimens.gap24),
      child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: controller.moduleList
              .map((module) => AppModuleCard(
                    module: module,
                  ))
              ?.toList(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: BDimens.gap24,
              mainAxisSpacing: BDimens.gap32,
              childAspectRatio: 1.2)),
    );
  }
}
