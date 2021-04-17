/*
 * @Description: 带动画的图片
 * @Author: iamsmiling
 * @Date: 2021-01-22 15:57:42
 * @LastEditTime: 2021-01-22 16:22:18
 */

import 'package:flutter/material.dart';

class XAnimationImage extends StatelessWidget {
  final String image;
  final String description;
  XAnimationImage(
    this.image, {
    Key key,
    this.description: '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: TweenAnimationBuilder(
        curve: Curves.bounceInOut,
        tween: Tween<double>(begin: 0, end: 255),
        duration: const Duration(milliseconds: 300),
        builder: (BuildContext context, double value, Widget child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(image),
              Container(
                margin: EdgeInsets.only(top: 44),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 18, letterSpacing: 1.2),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
