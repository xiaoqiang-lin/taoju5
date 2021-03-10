/*
 * @Description: 样式选择器
 * @Author: iamsmiling
 * @Date: 2020-12-24 13:42:30
 * @LastEditTime: 2020-12-28 10:38:55
 */
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_key.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/utils/curtain_product_attr_selector_kit.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';

class RoomAttrSelectorBar<T extends BaseCurtainProductAttrsSelectorController>
    extends StatelessWidget {
  final T controller;
  const RoomAttrSelectorBar({Key key, @required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: ProductKey.room,
      builder: (_) {
        return GestureDetector(
          onTap: () =>
              CurtainProductAttrSelectorKit.selectRoom(context, controller)
                  .whenComplete(() => _.update([ProductKey.room])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(_.room.typeName), Text(_.room.currentOptionName)],
          ),
        );
      },
    );
  }
}
