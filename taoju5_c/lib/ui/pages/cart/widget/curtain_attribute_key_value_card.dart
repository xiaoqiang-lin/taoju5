/*
 * @Description: 窗帘商品属性
 * @Author: iamsmiling
 * @Date: 2021-05-14 15:21:33
 * @LastEditTime: 2021-07-08 14:58:18
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/res/R.dart';

class CurtainAttributeKeyValueCard extends StatelessWidget {
  final bool signet;
  final List<CurtainAttributeKeyValuePairEntity> attributes;
  final double itemWidth;
  const CurtainAttributeKeyValueCard(
      {Key? key,
      required this.attributes,
      required this.itemWidth,
      this.signet = false})
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
      child: Stack(
        children: [
          Wrap(
            children: [
              for (CurtainAttributeKeyValuePairEntity item in attributes)
                Container(
                  width: itemWidth,
                  child: Text(
                    "${item.key}: ${item.value}",
                    style: TextStyle(
                        height: 1.8,
                        fontSize: R.dimen.sp10,
                        color: R.color.ff999999),
                  ),
                )
            ],
          ),
          Positioned(
              right: R.dimen.dp24,
              child: Visibility(
                  visible: signet, child: Image.asset(R.image.signet)))
        ],
      ),
    );
  }
}
