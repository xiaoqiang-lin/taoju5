/*
 * @Description: 样式选择
 * @Author: iamsmiling
 * @Date: 2021-01-18 14:21:06
 * @LastEditTime: 2021-01-18 15:01:45
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_border_frame.dart';

class CurtainProductAttrOptionCard extends StatelessWidget {
  final CurtainProductAttrOptionModel option;
  const CurtainProductAttrOptionCard({Key key, @required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          XBorderFrame(
            visible: option.isChecked,
            child: CachedNetworkImage(
              imageUrl: option.picture,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: BDimens.gap12),
            child: Text(
              option.name,
              style: TextStyle(fontSize: BDimens.sp24),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: BDimens.gap8),
            child: Text(
              "¥${option.price.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: BDimens.sp24,
                  color: option.price == 0.0 ? Colors.transparent : null),
            ),
          )
        ],
      ),
    );
  }
}
