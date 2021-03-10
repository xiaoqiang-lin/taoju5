/*
 * @Description: 风格样式
 * @Author: iamsmiling
 * @Date: 2021-01-15 14:49:41
 * @LastEditTime: 2021-01-15 14:58:07
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class XTagChip extends StatelessWidget {
  final String tag;
  const XTagChip({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
          padding: EdgeInsets.symmetric(vertical: 2),
          backgroundColor: BColors.lightYellowColor,
          label: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: BColors.accentColor, shape: BoxShape.circle),
                child: Text(
                  "#",
                  style: TextStyle(
                      color: BColors.primaryColor, fontSize: BDimens.sp22),
                ),
              ),
              Text(
                tag,
                style: TextStyle(
                    color: BColors.accentColor, fontSize: BDimens.sp24),
              )
            ],
          )),
    );
  }
}
