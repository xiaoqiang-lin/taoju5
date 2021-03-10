/*
 * @Description: 布艺帘商品属性选择卡片
 * @Author: iamsmiling
 * @Date: 2020-12-22 17:37:04
 * @LastEditTime: 2021-01-18 16:03:06
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/accessory/accessory_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/craft/craft_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_tip_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_bar.dart';

class FabircCurtainProductAttrsSelectorCard extends StatelessWidget {
  final String tag;
  const FabircCurtainProductAttrsSelectorCard({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeSelectorTipBar(tag: tag),
        GauzeAttrSelectorBar(tag: tag),
        CraftAttrSelectorBar(tag: tag),
        SectionalbarAttrSelectorBar(tag: tag),
        RibouxAttrSelectorBar(tag: tag),
        ValanceAttrSelectorBar(tag: tag),
        AccessoryAttrSelectorBar(tag: tag)
      ],
    );
  }
}
