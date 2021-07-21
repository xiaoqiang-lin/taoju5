/*
 * @Description: 软装方案
 * @Author: iamsmiling
 * @Date: 2021-07-21 11:17:04
 * @LastEditTime: 2021-07-21 14:14:46
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/home/home_soft_decoration_section_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/soft_decoration/soft_decoration_list_controller.dart';
import 'package:taoju5_c/ui/pages/soft_decoration/widget/soft_decoration_card.dart';

class SoftDecorationListPage extends GetView<SoftDecorationListController> {
  const SoftDecorationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp10 * 2) / 3.001;
    return Scaffold(
      appBar: AppBar(
        title: Text("软装专区"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
        child: Wrap(
          spacing: R.dimen.dp10,
          children: [
            for (SoftDecorationEntity item in controller.list)
              SoftDecorationCard(soft: item, width: w, height: w)
          ],
        ),
      ),
    );
  }
}
