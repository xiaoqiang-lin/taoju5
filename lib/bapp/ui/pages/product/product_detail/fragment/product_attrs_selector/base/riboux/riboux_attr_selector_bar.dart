/*
 * @Description:里布选择
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:18:43
 * @LastEditTime: 2021-01-19 15:46:35
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'riboux_attr_selector_controller.dart';

class RibouxAttrSelectorBar extends StatelessWidget {
  final String tag;
  const RibouxAttrSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RibouxAttrSelectorController>(
      tag: tag,
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("里布"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () =>
                showCurtainAttrSelectorModal<RibouxAttrSelectorController>(
                    title: "里布选择", tag: tag),
          ),
        );
      },
    );
  }
}
