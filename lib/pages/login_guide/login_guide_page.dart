/*
 * @Description: 登录引导页面
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:10:06
 * @LastEditTime: 2021-06-04 17:54:22
 */

import 'package:flutter/material.dart';

import 'login_guide_controller.dart';
import 'package:get/get.dart';

import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/login/section/login_header_section.dart';

class LoginGuidePage extends StatelessWidget {
  const LoginGuidePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 13)),
                elevation: MaterialStateProperty.all(0),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(StadiumBorder()),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return const Color(0xFFEE9B5F).withOpacity(.4);
                  }
                  return const Color(0xFFEE9B5F);
                }),
                foregroundColor: MaterialStateProperty.all(Colors.white),

                // padding: MaterialStateProperty.all(
                //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                side: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return null;
                  }
                  return BorderSide(color: const Color(0xFFEE9B5F));
                }),
                minimumSize:
                    MaterialStateProperty.all(Size(double.maxFinite, 50)))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 13)),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(StadiumBorder()),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  }
                  return const Color(0xFFEE9B5F);
                }),
                // padding: MaterialStateProperty.all(
                //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
                side: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return null;
                  }
                  return BorderSide(color: const Color(0xFFEE9B5F));
                }),
                minimumSize:
                    MaterialStateProperty.all(Size(double.maxFinite, 50)))),
      ),
      child: GetBuilder<LoginGuideController>(
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
                        child: ElevatedButton(
                          onPressed: _.loginAsCustomer,
                          child: Text(
                            "用户登录/注册",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: _.loginAsBussiness,
                        child: Text(
                          "商户登录",
                          style: TextStyle(
                              fontSize: 17,
                              color: const Color(0xFFEE9B5F),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
