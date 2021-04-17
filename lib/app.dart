/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2021-02-03 10:26:46
 * @LastEditTime: 2021-04-17 17:52:53
 */
import 'package:flutter/material.dart';
import 'package:taoju5_bc/config/app_env.dart';

import 'package:taoju5_b/app.dart';
import 'package:taoju5_c/app.dart';
import 'package:taoju5_bc/config/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaojuwuApp extends StatelessWidget {
  const TaojuwuApp({Key key}) : super(key: key);
  static const Map<AppEnv, Widget> APP_ENV = {
    AppEnv.$b: $BApp(),
    AppEnv.$c: $CAPP()
  };
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(constraints, Orientation.portrait,
            designSize: Size(750, 1334), allowFontScaling: false);
        return Material(
          child: APP_ENV[AppConfig.env],
        );
      },
    );
  }
}
