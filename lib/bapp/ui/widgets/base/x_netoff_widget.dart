/*
 * @Description: 网络错误
 * @Author: iamsmiling
 * @Date: 2021-01-22 16:02:57
 * @LastEditTime: 2021-01-22 16:20:23
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_animation_image.dart';

class XNetoffWidget extends StatelessWidget {
  final Function onTap;
  const XNetoffWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: XAnimationImage(
          "assets/images/" + "net_off.png",
          description: "哎呀，网络出错了，重新加载一下试试～",
        ));
  }
}
