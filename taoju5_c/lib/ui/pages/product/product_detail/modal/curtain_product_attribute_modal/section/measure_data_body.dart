/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-07-02 14:56:15
 * @LastEditTime: 2021-08-04 16:19:05
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

import '../curtain_product_attribute_controller.dart';
import 'room_expansion_panel.dart';
import 'window_open_mode_panel.dart';
import 'window_pattern_expansion_panel.dart';

class MeasureDataBody extends StatelessWidget {
  final ProductDetailEntity product;
  final CurtainProductAttributeController controller;
  const MeasureDataBody(
      {Key? key, required this.product, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: R.dimen.width,
          padding: EdgeInsets.only(top: R.dimen.dp12),
          child: Text(
            "测装数据",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: R.dimen.sp14, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RoomExpansionPanel(
                  room: product.attribute.measureData.room,
                  onRoomChanged: controller.selectRoom),
              WindowPatternExpansionPanel(
                measureData: product.attribute.measureData,
                onWindowFacadeChanged: controller.selectWindow,
                onInstallModeChanged: controller.selectInstallMode,
              ),
              WindowOpenModePanel(
                measureData: product.attribute.measureData,
                onOpenModeChanged: controller.selectOpenMode,
                onChildOpenModeChanged: controller.selectChildOpenMode,
                onSizeChanged: controller.update,
              )
            ]),
          ),
        ),
      ],
    );
  }
}
