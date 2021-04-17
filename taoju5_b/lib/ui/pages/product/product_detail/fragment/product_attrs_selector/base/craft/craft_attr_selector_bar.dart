/*
 * @Description:工艺方式选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:24:49
 * @LastEditTime: 2021-01-18 14:52:08
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5_b/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'craft_attr_selector_controller.dart';

class CraftAttrSelectorBar extends StatelessWidget {
  final String tag;
  const CraftAttrSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraftAttrSelectorController>(
      tag: tag,
      id: "attribute",
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("工艺方式"),
            key: ValueKey(_?.description),
            initialValue: _?.description,
            onFuture: () =>
                showCurtainAttrSelectorModal<CraftAttrSelectorController>(
                        title: "工艺选择", tag: tag)
                    .whenComplete(() {
              _.filterSectionalbar();
              Get.find<ProductDetailController>(tag: tag).update();
              // _.update();
            }),
          ),
        );
      },
    );
  }
}
