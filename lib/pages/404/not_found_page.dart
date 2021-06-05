/*
 * @Description: 404页面
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:51:44
 * @LastEditTime: 2021-06-04 14:52:41
 */

import 'package:flutter/material.dart';

class NotFound404Page extends StatelessWidget {
  const NotFound404Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
