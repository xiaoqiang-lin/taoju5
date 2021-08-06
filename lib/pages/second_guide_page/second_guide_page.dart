/*
 * @Description: 引导页2
 * @Author: iamsmiling
 * @Date: 2021-07-27 17:14:12
 * @LastEditTime: 2021-07-27 17:29:51
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/routes/app_routes.dart';

class SecondGuidePage extends StatelessWidget {
  const SecondGuidePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: kToolbarHeight * 2),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 72),
                child: Image.asset("resources/images/guide_slogan2.png"),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 106),
                child: Image.asset("resources/images/guide_logo2.png"),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.loginGuide),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEE9B5F),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    "开始使用",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
