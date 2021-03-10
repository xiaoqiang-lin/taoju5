/*
 * @Description: labletile
 * @Author: iamsmiling
 * @Date: 2021-01-07 21:47:59
 * @LastEditTime: 2021-01-07 21:55:23
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_icons.dart';

class XLabelTile extends StatelessWidget {
  final String label;
  final TextStyle labelTextStyle;
  final Widget trailing;
  final Function onTap;
  const XLabelTile(
      {Key key,
      @required this.label,
      this.labelTextStyle,
      this.trailing = const SizedBox.shrink(),
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: [Text(label), Spacer(), trailing, Icon(BIcons.next)],
        ),
      ),
    );
  }
}
