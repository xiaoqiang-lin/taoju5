/*
 * @Description: 极光推送
 * @Author: iamsmiling
 * @Date: 2021-03-01 16:01:26
 * @LastEditTime: 2021-06-22 17:11:49
 */
// import 'package:jpush_flutter/jpush_flutter.dart';

import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_bc/config/sdk_manager/i_sdk_initializer.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JPushSdk implements ISdkInitializer {
  JPush jPush = JPush();
  @override
  bool hasInited = false;

  @override
  void init() {
    jPush.setup(
        appKey: AppConfig.jpushAppKey,
        production: true,
        channel: "developer-default",
        debug: false);
    jPush.setAlias("tjw");
    hasInited = true;
  }

  @override
  void release() {
    jPush = null;
    hasInited = false;
  }
}
