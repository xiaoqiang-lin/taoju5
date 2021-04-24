/*
 * @Description: 返回按钮
 * @Author: iamsmiling
 * @Date: 2021-04-22 13:02:53
 * @LastEditTime: 2021-04-22 13:07:52
 */
import 'package:flutter/material.dart';

class PrimaryBackButton extends StatelessWidget {
  final Widget? label;
  final TextStyle? labelStyle;
  const PrimaryBackButton({Key? key, this.label, this.labelStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: Navigator.of(context).maybePop,
        ),
        label == null ? SizedBox.shrink() : label!
      ],
    );
  }
}
