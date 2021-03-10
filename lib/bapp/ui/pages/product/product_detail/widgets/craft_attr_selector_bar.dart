/*
 * @Description: 工艺选择
 * @Author: iamsmiling
 * @Date: 2020-12-24 16:02:08
 * @LastEditTime: 2020-12-28 10:41:23
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base_curtain_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_key.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/utils/curtain_product_attr_selector_kit.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';

class CraftAttrSelectorBar<T extends BaseCurtainProductAttrsSelectorController>
    extends StatelessWidget {
  final T controller;
  const CraftAttrSelectorBar({Key key, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      id: ProductKey.craft,
      builder: (_) {
        return GestureDetector(
          onTap: () =>
              CurtainProductAttrSelectorKit.selectCraft(context, controller)
                  .whenComplete(() => _.update([ProductKey.craft, "5"])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(_.craft.typeName), Text(_.craft.currentOptionName)],
          ),
        );
      },
    );
  }
}
