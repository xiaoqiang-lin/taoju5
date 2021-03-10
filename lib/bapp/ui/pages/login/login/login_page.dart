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
import 'package:taoju5/bapp/ui/widgets/bloc/x_sms_button.dart';

import 'widget/loge_indicator.dart';

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
                // GetBuilder<LoginController>(
                //   id: "mode",
                //   builder: (_) {
                //     return Row(
                //       children: [
                //         Row(
                //           children: [
                //             Text("密码登录"),
                //             Checkbox(
                //                 value: _.loginMode == LoginMode.password,
                //                 onChanged: (bool flag) {
                //                   _.loginMode = LoginMode.password;
                //                   _.update(["mode"]);
                //                 }),
                //           ],
                //         ),

                //         Row(
                //           children: [
                //             Text("验证码登录"),
                //             Checkbox(
                //                 value: _.loginMode == LoginMode.sms,
                //                 onChanged: (bool flag) {
                //                   _.loginMode = LoginMode.sms;
                //                   _.update(["mode"]);
                //                 }),
                //           ],
                //         ),
                //       ],
                //     );
                //   },
                // ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "请输入手机号码"),
                        onChanged: (String text) {
                          _.paramModel.mobile = text;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "请输入密码"),
                        onChanged: (String text) {
                          _.paramModel.password = text;
                        },
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(hintText: "请输入验证码"),
                        onChanged: (String text) {
                          _.paramModel.code = text;
                        },
                      ),
                    ],
                  ),
                ),
                XSmsButton(
                  onFuture: _.getSms,
                ),
                TextButton(onPressed: _.login, child: Text("登录"))
              ],
            );
          },
        ),
      ),
    );
  }
}
