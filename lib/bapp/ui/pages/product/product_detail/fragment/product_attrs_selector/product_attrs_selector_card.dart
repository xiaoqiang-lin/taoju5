/*
 * @Description: 商品属性选择器
 * @Author: iamsmiling
 * @Date: 2020-12-25 13:26:21
 * @LastEditTime: 2021-01-19 15:39:37
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'fabric_curtain_product_attrs_selector/fabric_curtain_product_attrs_selector_card.dart';
import 'gauze_curtain_product_attrs_selector/gauze_curtain_product_attrs_selector_card.dart';

class ProductAttrsSelectorCard extends StatelessWidget {
  final String tag;
  final BaseProductType productType;
  const ProductAttrsSelectorCard(
      {Key key, @required this.tag, @required this.productType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: BDimens.gap16),
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
      color: BColors.primaryColor,
      child: Column(
        children: [
          Visibility(
            child: FabircCurtainProductAttrsSelectorCard(
              tag: tag,
            ),
            visible: productType is FabricCurtainProductType,
          ),
          Visibility(
            child: GauzeCurtainProductAttrsSelectorCard(tag: tag),
            visible: productType is GauzeCurtainProductType,
          ),
          // Visibility(
          //   child: RollingCurtainProductAttrsSelectorCard(),
          //   visible: productType is RollingCurtainProductType,
          // ),
        ],
      ),
    );
  }
}
