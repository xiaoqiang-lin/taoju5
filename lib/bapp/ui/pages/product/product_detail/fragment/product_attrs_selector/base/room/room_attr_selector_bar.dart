/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-17 17:38:08
 * @LastEditTime: 2021-01-19 11:25:18
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/room_attr_selector.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'room_attr_selector_controller.dart';

class RoomAttrSelectorBar extends StatelessWidget {
  final String tag;
  const RoomAttrSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomAttrSelectorController>(
      tag: tag,
      id: "value",
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("空间"),
            key: ValueKey(_?.value),
            initialValue: _?.value,
            onFuture: () =>
                showRoomAttrSelectorModal(tag: tag, onConfirm: _.confirm),
          ),
        );
      },
    );
  }
}
