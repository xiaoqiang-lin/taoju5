import 'package:flutter/material.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';

class ProductOnSaleTag extends StatelessWidget {
  final String description;
  final EdgeInsets padding;
  final EdgeInsets margin;
  const ProductOnSaleTag(
      {Key key,
      this.description = "限时特价",
      this.padding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.red.shade200, borderRadius: BorderRadius.circular(2)),
      child: Text(
        description,
        style: TextStyle(color: BColors.primaryColor, fontSize: BDimens.sp20),
      ),
    );
  }
}
