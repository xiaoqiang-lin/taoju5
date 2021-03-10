/*
 * @Description: 配饰选择
 * @Author: iamsmiling
 * @Date: 2021-01-18 11:00:37
 * @LastEditTime: 2021-01-18 15:03:28
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'accessory_attr_selector_controller.dart';

class AccessoryAttrSelectorBar extends StatelessWidget {
  final String tag;
  const AccessoryAttrSelectorBar({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccessoryAttrSelectorController>(
      tag: tag,
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("配饰"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () =>
                showCurtainAttrSelectorModal<AccessoryAttrSelectorController>(
                    title: "配饰选择", tag: tag),
          ),
        );
      },
    );
  }
}
