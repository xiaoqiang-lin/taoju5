import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class XGraphTitle extends StatelessWidget {
  final String title;
  const XGraphTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: BDimens.gap12, vertical: BDimens.gap8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.2),
          color: BColors.scaffoldBgColor),
      child: Text(
        title,
        style: TextStyle(
            fontSize: BDimens.sp22, color: BColors.descriptionTextColor),
      ),
    );
  }
}
