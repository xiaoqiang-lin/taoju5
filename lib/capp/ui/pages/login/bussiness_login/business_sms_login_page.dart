/*
 * @Description: 商家验证码登陆
 * @Author: iamsmiling
 * @Date: 2021-04-14 16:57:41
 * @LastEditTime: 2021-04-15 17:07:43
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/component/button/primary_button.dart';
import 'package:taoju5/capp/component/textfield/sms_text_field.dart';
import 'package:taoju5/capp/component/textfield/telephone_text_field.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/login/bussiness_login/bussiness_login_controller.dart';
import 'package:taoju5/capp/ui/pages/login/section/login_footer_section.dart';
import 'package:taoju5/capp/ui/pages/login/section/login_header_section.dart';

class CBusinessSmsLoginPage extends StatelessWidget {
  const CBusinessSmsLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CBusinessLoginController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("商户登录"),
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: R.dimen.dp30),
              child: Column(
                children: [
                  CLoginHeaderSection(),
                  Container(
                    margin: EdgeInsets.only(bottom: R.dimen.dp24),
                    padding: EdgeInsets.symmetric(horizontal: R.dimen.dp56),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: R.dimen.dp48, bottom: R.dimen.dp20),
                          child: TelephoneTextField(),
                        ),
                        SmsTextField(
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: R.dimen.dp48),
                    child: CPrimaryButton(
                      text: "登录",
                      size: CPrimaryButtonSize.large,
                      onPressed: () {},
                    ),
                  ),
                  CLoginFooterSection()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
