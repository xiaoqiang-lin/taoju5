/*
 * @Description: 登录引导页面
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-17 16:35:20
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/guide/login_guide_controller.dart';
import 'package:taoju5_c/ui/pages/login/section/login_header_section.dart';

class LoginGuidePage extends StatelessWidget {
  const LoginGuidePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginGuideController>(
        init: LoginGuideController(),
        builder: (_) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: kToolbarHeight * 2 + R.dimen.dp20,
                    left: R.dimen.dp56,
                    right: R.dimen.dp56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LoginHeaderSection(),
                    Container(
                      margin: EdgeInsets.only(
                          top: R.dimen.dp100, bottom: R.dimen.dp20),
                      child: PrimaryButton(
                        onPressed: _.loginAsCustomer,
                        text: "用户登录/注册",
                        size: PrimaryButtonSize.large,
                        mode: PrimaryButtonMode.elevatedButton,
                      ),
                    ),
                    PrimaryButton(
                      onPressed: _.loginAsBussiness,
                      text: "商户登录",
                      size: PrimaryButtonSize.large,
                      mode: PrimaryButtonMode.outlinedButton,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
