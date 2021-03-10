/*
 * @Description: 重置密码
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:43:15
 * @LastEditTime: 2020-12-28 16:59:05
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/login/login/login_controller.dart';

class ForgetPasswrdPage extends StatelessWidget {
  const ForgetPasswrdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("找回密码"),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<LoginController>(
            builder: (_) {
              return Column(
                children: [
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "去登录页面"),
                      )
                    ],
                  ))
                ],
              );
            },
          ),
        ));
  }
}
