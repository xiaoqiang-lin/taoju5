/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-07-02 14:56:15
 * @LastEditTime: 2021-07-08 14:50:46
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

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
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: RoomExpansionPanel(
              room: product.attribute.measureData.room,
              onRoomChanged: controller.selectRoom),
        ),
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
    );
  }
}
