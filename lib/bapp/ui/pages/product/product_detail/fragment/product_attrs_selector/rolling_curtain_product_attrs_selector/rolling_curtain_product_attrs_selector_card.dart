/*
 * @Description: 卷帘商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:16:09
 * @LastEditTime: 2021-02-01 16:58:01
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/rolling_curtain_product_attrs_selector/rolling_curtain_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

class RollingCurtainProductAttrsSelectorCard extends StatelessWidget {
  final String tag;
  const RollingCurtainProductAttrsSelectorCard({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RollingCurtainProductAttrsSelectorController>(
      tag: tag,
      builder: (_) {
        return Column(
          children: [
            RoomAttrSelectorBar(tag: tag),
            PatternSelectorBar(tag: tag),
            XSelectorTextField(
              label: Text("尺寸"),
              initialValue: _.sizeValue,
              hintText: "请输入尺寸",
              key: ValueKey(_.sizeValue),
              onFuture: _.openEditSizeDialog,
            ),
            XSelectorTextField(
              label: Text("离地距离"),
              initialValue: _.deltaY,
              hintText: "请输入离地距离",
              key: ValueKey(_.deltaY),
              onFuture: _.openEditDeltaYDialog,
            )
          ],
        );
      },
      initState: (_) {
        // ProductDetailController productDetailController =
        //     Get.find<ProductDetailController>();
        // productDetailController.selectorController =
        // Get.find<RollingCurtainProductAttrsSelectorController>();
      },
    );
  }
}
