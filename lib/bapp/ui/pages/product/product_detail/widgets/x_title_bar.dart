/*
 * @Description:标题
 * @Author: iamsmiling
 * @Date: 2021-01-19 17:37:57
 * @LastEditTime: 2021-02-02 13:40:53
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';

class XTitleBar extends StatelessWidget {
  final String title;
  final Widget trailing;
  final Function onTap;
  const XTitleBar({Key key, this.title, this.trailing, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: BColors.primaryColor,
        margin: EdgeInsets.only(bottom: BDimens.gap12),
        padding: EdgeInsets.symmetric(vertical: BDimens.gap10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: BDimens.sp28, fontWeight: FontWeight.w500)),
            Spacer(),
            trailing ??
                Row(
                  children: [
                    Text("查看全部"),
                    Icon(BIcons.next),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
