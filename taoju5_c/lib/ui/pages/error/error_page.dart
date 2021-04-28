/*
 * @Description: 错误页面
 * @Author: iamsmiling
 * @Date: 2021-04-27 13:45:51
 * @LastEditTime: 2021-04-27 13:47:03
 */
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text("出现程序bug"));
  }
}
