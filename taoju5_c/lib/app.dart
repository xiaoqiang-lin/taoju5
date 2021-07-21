/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:54:58
 * @LastEditTime: 2021-07-16 15:37:57
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_config.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_env.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_c/ui/pages/main/main_binding.dart';
import 'package:taoju5_c/ui/pages/main/main_page.dart';

import 'res/R.dart';
import 'routes/app_pages.dart';

class $CAPP extends StatelessWidget {
  const $CAPP({Key? key}) : super(key: key);

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
      footerBuilder: () => ClassicFooter(
        loadingText: '正在加载',
        noDataText: '我也是有底线的哦',
        failedText: '加载失败',
        canLoadingText: '上拉加载更多',
        idleText: '上拉加载更多',
        // noMoreIcon: SizedBox(
        //   width: 30,
        //   height: 30,
        //   child: FlareActor(
        //     'sad_emoji.flr',
        //     animation: 'no_more_data',
        //   ),
        // ),
        height: 50,
        loadingIcon: SizedBox(
          width: 25,
          height: 25,
          child: CupertinoActivityIndicator(),
        ),
      ),
      footerTriggerDistance: 56,
      child: GetMaterialApp(
        key: ValueKey(AppEnv.$c),
        title: AppConfig.appName,
        getPages: AppPages.pages,
        initialRoute: AppRoutes.main,
        home: MainPage(),
        initialBinding: MainBinding(),
        theme: R.theme.lightTheme,
        defaultTransition: Transition.cupertino,
        popGesture: false,
        // builder: EasyLoading.init(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(
                boldText: false,
                textScaleFactor: GetPlatform.isAndroid ? .88 : 1.0),
            child: FlutterEasyLoading(child: child!),
          );
        },
        // defaultTransition: Transition,

        localizationsDelegates: [
          // CupertinoLocalizationDelegate.delegate,
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
          GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
          GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
        ],
        supportedLocales: [Locale("en"), Locale("zh")],
      ),
    );
  }
}
