/*
 * @Description: 登录方式指示器
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:45:02
 * @LastEditTime: 2021-01-12 13:19:13
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/login/login/login_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_indicator_painter.dart';

class LoginIndicator extends StatefulWidget {
  const LoginIndicator({Key key}) : super(key: key);

  @override
  _LoginIndicatorState createState() => _LoginIndicatorState();
}

class _LoginIndicatorState extends State<LoginIndicator> {
  ///[ctx1],[ctx2]用于获取坐标位置
  BuildContext ctx1;
  BuildContext ctx2;

  double startX1 = 0;
  double startX2 = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox box1 = ctx1.findRenderObject();
      RenderBox box2 = ctx2.findRenderObject();
      Offset position1 = box1.localToGlobal(Offset.zero);
      Offset position2 = box2.localToGlobal(Offset.zero);
      Size size1 = box1.size;
      Size size2 = box2.size;

      ///取中间坐标
      startX1 = position1.dx + (size1.width / 2);
      startX2 = position2.dx + (size2.width / 2);

      print(startX1);
      print(startX2);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Container(
          margin: EdgeInsets.only(top: 72.h),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Builder(builder: (BuildContext ctx) {
                        ctx1 = ctx;
                        return Text("密码登录");
                      }),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Builder(builder: (BuildContext ctx) {
                        ctx2 = ctx;
                        return Text("验证码登录");
                      }),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap32),
                child: CustomPaint(
                    painter: LoginIndicatorPainter(
                        startX1: startX1, startX2: startX2)),
              )
            ],
          ),
        );
      },
    );
  }
}
