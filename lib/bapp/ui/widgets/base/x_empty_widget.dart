/*
 * @Description: 空视图
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:20:28
 * @LastEditTime: 2021-01-22 16:09:17
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_animation_image.dart';

class XEmptyWidget extends StatelessWidget {
  final Function onTap;
  const XEmptyWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: XAnimationImage(
          "assets/images/" + "empty.png",
          description: "什么也没有呢～",
        ));
  }
}
