/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2021-02-03 10:26:46
 * @LastEditTime: 2021-08-06 11:16:45
 */
import 'package:flutter/material.dart';
import 'package:taoju5/config/app_env.dart';

import 'bapp/app.dart';
import 'config/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaojuwuApp extends StatelessWidget {
  const TaojuwuApp({Key key}) : super(key: key);
  static const Map<AppEnv, Widget> APP_ENV = {
    AppEnv.$b: $BApp(),
  };
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenUtil.init(
          constraints,
          Orientation.portrait,
          designSize: Size(750, 1334),
        );
        return Material(
          child: APP_ENV[AppConfig.env],
        );
      },
    );
  }
}
