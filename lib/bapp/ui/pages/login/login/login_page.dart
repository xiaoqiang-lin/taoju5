/*
 * @Description: 登录
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:07:58
 * @LastEditTime: 2021-01-12 13:56:17
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/login/login/login_controller.dart';

import 'widget/loge_indicator.dart';
import 'widget/x_sms_input_field.dart';
import 'widget/x_tel_input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BColors.primaryColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(
          builder: (_) {
            return Column(
              children: [
                Text(
                  "欢迎来到淘居屋",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: BColors.titleColor,
                      fontSize: BDimens.sp48),
                ),
                LoginIndicator(),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                    child: Column(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.symmetric(vertical: BDimens.gap16),
                            child: XTelInputField(
                              onChanged: _.setTel,
                            )),
                        IndexedStack(
                          index: _.loginMode == LoginMode.password ? 1 : 0,
                          children: [
                            XSmsTextField(onChanged: _.setSms),
                            TextFormField(
                              obscureText: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(hintText: "请输入密码"),
                              onChanged: _.setPassword,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: BDimens.gap48, horizontal: BDimens.gap16),
                    width: Get.width,
                    child: ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    BColors.buttonColor),
                                minimumSize:
                                    MaterialStateProperty.all(Size(172, 56)))),
                        child: ElevatedButton(
                            onPressed: _.login, child: Text("登录"))))
              ],
            );
          },
        ),
      ),
    );
  }
}
