/*
 * @Description: 修改密码第二部
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:06:30
 * @LastEditTime: 2021-06-07 16:16:42
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/password_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/login/modify_password/modify_password_controller.dart';
import 'package:get/get.dart';

class ModifyPasswordSecondPage extends GetView<ModifyPasswordController> {
  const ModifyPasswordSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(top: R.dimen.dp50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: R.dimen.dp56,
                    right: R.dimen.dp56,
                    bottom: R.dimen.dp50),
                child: Column(
                  children: [
                    Text("设置密码",
                        style: TextStyle(
                            fontSize: R.dimen.sp18,
                            fontFamily: "PingFang",
                            fontWeight: FontWeight.w600)),
                    Container(
                      margin: EdgeInsets.only(
                          top: R.dimen.dp48, bottom: R.dimen.dp20),
                      child: PasswordTextField(
                        hintText: "请输入您要设置的密码",
                        onChanged: controller.setPassword1,
                      ),
                    ),
                    PasswordTextField(
                      hintText: "请再次确认密码",
                      onChanged: controller.setPassword2,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                  margin: EdgeInsets.symmetric(horizontal: R.dimen.dp56),
                  size: PrimaryButtonSize.large,
                  text: "确定",
                  textStyle: TextStyle(fontSize: R.dimen.sp17),
                  onPressed: controller.submit)
            ],
          ),
        ),
      ),
    );
  }
}
