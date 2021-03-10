/*
 * @Description: 404页面
 * @Author: iamsmiling
 * @Date: 2021-01-23 14:27:00
 * @LastEditTime: 2021-01-23 14:50:44
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';

class NotFound404Page extends StatelessWidget {
  const NotFound404Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BColors.primaryColor,
      appBar: AppBar(
        title: Text("页面未找到"),
      ),
      body: Container(
        height: double.maxFinite,
        child: Image.asset("assets/images/" + "404.png"),
      ),
    );
  }
}
