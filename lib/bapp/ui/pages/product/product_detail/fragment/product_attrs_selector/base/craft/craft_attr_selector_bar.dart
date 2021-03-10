/*
 * @Description:工艺方式选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:24:49
 * @LastEditTime: 2021-01-18 14:52:08
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'craft_attr_selector_controller.dart';

class CraftAttrSelectorBar extends StatelessWidget {
  final String tag;
  const CraftAttrSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CraftAttrSelectorController>(
      tag: tag,
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("工艺方式"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () =>
                showCurtainAttrSelectorModal<CraftAttrSelectorController>(
                    title: "工艺选择", tag: tag),
          ),
        );
      },
    );
  }
}
