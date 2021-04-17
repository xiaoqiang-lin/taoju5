/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-17 17:38:08
 * @LastEditTime: 2021-01-19 11:25:18
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/product_mixin_model.dart';
import 'package:taoju5_b/ui/widgets/common/textfield/x_selector_text_field.dart';

import 'room_attr_selector_controller.dart';

class RoomAttrSelectorBar extends StatelessWidget {
  final String tag;
  final ProductMixinModel product;
  const RoomAttrSelectorBar({Key key, @required this.tag, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomAttrSelectorController>(
      tag: tag,
      id: "value",
      autoRemove: false,
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("空间"),
            key: ValueKey(_?.value),
            initialValue: _?.value,
            onFuture: () => _?.openRoomAttrSelectorModal(
                tag: tag, onConfirm: _?.confirm, product: product),
            // onFuture: () =>
            //     showRoomAttrSelectorModal(tag: tag, onConfirm: _.confirm)
            //         .then((value) {
            //   if (product != null) {
            //     product.room = _.value;
            //     product.roomId = _.id;
            //     Get.find<DesignProductModalController>().update();
            //   }
            // }
            // ),
          ),
        );
      },
    );
  }
}
