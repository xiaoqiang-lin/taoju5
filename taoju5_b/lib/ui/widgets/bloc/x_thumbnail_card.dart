/*
 * @Description: 缩略图卡片
 * @Author: iamsmiling
 * @Date: 2021-01-19 16:29:24
 * @LastEditTime: 2021-01-19 16:43:31
 */
import 'package:flutter/material.dart';

class XThumbnailCard extends StatelessWidget {
  final Widget child;
  const XThumbnailCard({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 2,
                color: Color.fromARGB(45, 0, 0, 0)),
          ]),
      child: child,
    );
  }
}
