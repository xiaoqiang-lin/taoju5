/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:22:15
 * @LastEditTime: 2021-02-19 22:20:06
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taoju5/bapp/res/b_theme.dart';

import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/routes/bapp_route_middleware.dart';
import 'package:taoju5/config/app_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5/config/app_env.dart';
// import 'package:taoju5/bapp/ui/widgets/pages/home/home_page.dart';

import 'ui/pages/home/home_binding.dart';

class $BApp extends StatelessWidget {
  const $BApp({Key key}) : super(key: key);

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
      // Configure d// Configure the defau
      child: GetMaterialApp(
        key: ValueKey(AppEnv.$b),
        title: AppConfig.appName ?? "test",
        unknownRoute: BAppPages.unkonw,
        getPages: BAppPages.pages,
        theme: BTheme.lightTheme,
        initialRoute: BAppPages.initial,
        initialBinding: TaojuwuBinding(),
        builder: EasyLoading.init(),
        defaultTransition: Transition.cupertino,
        popGesture: false,
        // defaultTransition: Transition,
        debugShowCheckedModeBanner: AppConfig.isDebug,

        localizationsDelegates: [
          // CupertinoLocalizationDelegate.delegate,
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
          GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
          GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
          GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
        ],
        supportedLocales: [Locale("en"), Locale("zh")],
        routingCallback: BAppRouteMiddleWare.observer,
        navigatorKey: Get.key,
      ),
    );
  }
}
