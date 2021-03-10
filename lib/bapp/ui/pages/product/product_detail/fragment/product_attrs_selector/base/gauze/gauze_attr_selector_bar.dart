/*
 * @Description: 窗纱属性选择
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:11:20
 * @LastEditTime: 2021-01-19 15:46:26
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'gauze_attr_selector_controller.dart';

class GauzeAttrSelectorBar extends StatelessWidget {
  final String tag;
  const GauzeAttrSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GauzeAttrSelectorController>(
      tag: tag,
      id: "attribute",
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("窗纱"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () =>
                showCurtainAttrSelectorModal<GauzeAttrSelectorController>(
                    title: "选择窗纱", tag: tag),
          ),
        );
      },
    );
  }
}
