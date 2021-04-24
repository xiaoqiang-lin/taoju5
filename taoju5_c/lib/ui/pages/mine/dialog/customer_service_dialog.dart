/*
 * @Description: 客服对话框
 * @Author: iamsmiling
 * @Date: 2021-04-22 19:04:36
 * @LastEditTime: 2021-04-22 19:07:55
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future openCustomerServiceDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("客服电话"),
          content: Text("400-6666-8888"),
          actions: [
            TextButton(onPressed: Navigator.of(context).pop, child: Text("取消")),
            TextButton(onPressed: () {}, child: Text("立即拨打")),
          ],
        );
      });
}
