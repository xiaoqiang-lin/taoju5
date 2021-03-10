/*
 * @Description: 窗纱商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:16:52
 * @LastEditTime: 2021-01-18 13:44:53
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/accessory/accessory_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/craft/craft_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_tip_bar.dart';

class GauzeCurtainProductAttrsSelectorCard extends StatelessWidget {
  final String tag;
  const GauzeCurtainProductAttrsSelectorCard({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeSelectorTipBar(tag: tag),
        CraftAttrSelectorBar(tag: tag),
        SectionalbarAttrSelectorBar(tag: tag),
        AccessoryAttrSelectorBar(tag: tag)
      ],
    );
  }
}
