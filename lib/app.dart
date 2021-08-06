/*
 * @Description: app
 * @Author: iamsmiling
 *  @Date: 2021-02-03 10:26:46
 * @LastEditTime: 2021-08-05 16:44:21
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/app/app_binding.dart';
import 'package:taoju5/routes/app_pages.dart';
import 'package:taoju5/routes/app_routes.dart';
import 'package:taoju5_bc/config/app_env.dart';

import 'package:taoju5_b/app.dart';
import 'package:taoju5_c/app.dart';

import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_b/res/b_theme.dart';
// import 'package:taoju5_bc/config/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TaojuwuApp extends StatelessWidget {
  const TaojuwuApp({Key key}) : super(key: key);
  static const Map<AppEnv, Widget> APP_ENV = {
    AppEnv.$b: $BApp(),
    AppEnv.$c: $CAPP()
  };
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => WaterDropHeader(
        refresh: Text(
          '正在刷新',
          style: TextStyle(color: Colors.grey),
        ),
        complete: Text('刷新成功', style: TextStyle(color: Colors.grey)),
        failed: Text('刷新失败', style: TextStyle(color: Colors.grey)),
      ),
      footerTriggerDistance: 72,
      hideFooterWhenNotFull: true, // Viewport不满一屏时,禁用上拉加载更多功能
      footerBuilder: () => ClassicFooter(
        loadingText: '正在加载',
        noDataText: '我也是有底线的哦',
        failedText: '加载失败',
        canLoadingText: '上拉加载更多',
        idleText: '上拉加载更多',
        height: 48,
        loadingIcon: SizedBox(
          width: 24,
          height: 24,
          child: CupertinoActivityIndicator(),
        ),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          ScreenUtil.init(constraints,
              orientation: Orientation.portrait, designSize: Size(750, 1334));
          return GetMaterialApp(
            themeMode: ThemeMode.light,
            theme: R.theme.lightTheme,
            darkTheme: BTheme.lightTheme,
            unknownRoute: AppPages.unkonw,
            initialRoute: AppRoutes.initial,
            getPages: AppPages.pages,
            builder: (BuildContext context, Widget child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    boldText: false,
                    textScaleFactor: GetPlatform.isAndroid ? 0.88 : 1.0),
                child: FlutterEasyLoading(child: child),
              );
            },
            // builder: EasyLoading.init(),
            initialBinding: AppBinding(),
            defaultTransition: Transition.cupertino,
          );
        },
      ),
    );
  }
}
