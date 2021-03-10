/*
 * @Description: 网络错误
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:19:30
 * @LastEditTime: 2021-01-22 16:07:29
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_animation_image.dart';

class XErrorWidget extends StatelessWidget {
  final Function onTap;
  const XErrorWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: XAnimationImage(
          "assets/images/" + "net_err.png",
          description: "加载失败,请点击重试",
        ));
  }
}
