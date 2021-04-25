/*
 * @Description: //TODO
 * @Author: iamsmiling
 * @Date: 2021-04-24 21:01:53
 * @LastEditTime: 2021-04-24 21:02:54
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/texture_image.dart';

class FrescoPage extends StatelessWidget {
  const FrescoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextureImage(
          url:
              "https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/dc49d48471fb4a298af735c31c6ad71f~tplv-k3u1fbpfcp-watermark.image"),
    );
  }
}
