/*
 * @Description: 商户登录
 * @Author: iamsmiling
 * @Date: 2021-04-14 16:56:35
 * @LastEditTime: 2021-04-17 16:38:52
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/password_text_field.dart';
import 'package:taoju5_c/component/textfield/telephone_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/capp_routes.dart';
import 'package:taoju5_c/ui/pages/login/bussiness_login/bussiness_login_controller.dart';
import 'package:taoju5_c/ui/pages/login/section/login_footer_section.dart';
import 'package:taoju5_c/ui/pages/login/section/login_header_section.dart';

class CBusinessPasswordLoginPage extends StatelessWidget {
  const CBusinessPasswordLoginPage({Key key}) : super(key: key);

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
                          child: CTelephoneTextField(),
                        ),
                        PasswordTextField(),
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.only(top: R.dimen.dp10),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Text(
                              "验证码登录",
                              style: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: R.color.primaryColor),
                            ),
                            onTap: () =>
                                Get.toNamed(CAppRoutes.businessSmsLogin),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: R.dimen.dp20),
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
