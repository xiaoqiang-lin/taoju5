/*
 * @Description:窗型选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 16:43:13
 * @LastEditTime: 2021-01-19 14:39:42
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/window/window_pattern_modal.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'window_pattern_selector_controller.dart';

class PatternSelectorBar extends StatelessWidget {
  final String tag;
  const PatternSelectorBar({Key key, @required this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WindowPatternSelectorController>(
      tag: tag,
      id: "value",
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("窗型"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () => showWindowPatternModal(tag: tag),
          ),
        );
      },
    );
  }
}
