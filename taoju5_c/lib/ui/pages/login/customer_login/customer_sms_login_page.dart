/*
 * @Description: 验证码登陆
 * @Author: iamsmiling
 * @Date: 2021-04-14 15:14:00
 * @LastEditTime: 2021-04-17 16:38:21
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/sms_text_field.dart';
import 'package:taoju5_c/component/textfield/telephone_text_field.dart';
import 'package:taoju5_c/domain/entity/params/login/login_params.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/customer_login/customer_login_controller.dart';
import 'package:taoju5_c/ui/pages/login/section/login_footer_section.dart';
import 'package:taoju5_c/ui/pages/login/section/login_header_section.dart';

class CustomerSmsLoginPage extends StatelessWidget {
  const CustomerSmsLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerLoginController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: kToolbarHeight + R.dimen.dp20),
            child: Column(
              children: [
                LoginHeaderSection(),
                Container(
                  margin: EdgeInsets.only(bottom: R.dimen.dp24),
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp56),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: R.dimen.dp48, bottom: R.dimen.dp20),
                        child: TelephoneTextField(onChanged: _.setTelephone),
                      ),
                      SmsTextField(
                          onChanged: _.setSmsCode, onPressed: _.getSmsCode),
                      Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: R.dimen.dp10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "未注册账号登录后直接注册",
                          style: TextStyle(
                              fontSize: R.dimen.sp12,
                              color: R.color.secondPrimaryTextColor),
                        ),
                      )
                    ],
                  ),
                ),
                PrimaryButton(
                  text: "验证码登录",
                  size: PrimaryButtonSize.big,
                  onPressed: () =>
                      _.login(SmsCodeLoginStrategy(), CLoginMode.sms),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp20),
                  child: PrimaryButton(
                    text: "微信登录",
                    size: PrimaryButtonSize.big,
                    mode: PrimaryButtonMode.outlinedButton,
                    onPressed: () =>
                        _.login(WeChatLoginStrategy(), CLoginMode.wechat),
                  ),
                ),
                LoginFooterSection()
              ],
            ),
          ),
        ),
      );
    });
  }
}
