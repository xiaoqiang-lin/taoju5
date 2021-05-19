/*
 * @Description: 窗帘商品属性
 * @Author: iamsmiling
 * @Date: 2021-05-14 15:21:33
 * @LastEditTime: 2021-05-14 17:28:43
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/res/R.dart';

class CurtainAttributeKeyValueCard extends StatelessWidget {
  final List<CurtainAttributeKeyValuePairEntity> attributes;
  final double itemWidth;
  const CurtainAttributeKeyValueCard(
      {Key? key, required this.attributes, required this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding:
          EdgeInsets.symmetric(horizontal: R.dimen.dp12, vertical: R.dimen.dp8),
      decoration: BoxDecoration(
          color: R.color.fff8f8f8,
          borderRadius: BorderRadius.circular(R.dimen.sp3)),
      child: Wrap(
        children: [
          for (CurtainAttributeKeyValuePairEntity item in attributes)
            Container(
              width: itemWidth,
              child: Text(
                "${item.key}: ${item.value}",
                style:
                    TextStyle(fontSize: R.dimen.sp10, color: R.color.ff999999),
              ),
            )
        ],
      ),
    );
  }
}
