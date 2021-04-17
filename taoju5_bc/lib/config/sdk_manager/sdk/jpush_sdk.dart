/*
 * @Description: 极光推送
 * @Author: iamsmiling
 * @Date: 2021-03-01 16:01:26
 * @LastEditTime: 2021-04-17 17:51:16
 */
// import 'package:jpush_flutter/jpush_flutter.dart';

import 'package:taoju5_bc/config/sdk_manager/i_sdk_initializer.dart';

class JPushSdk implements ISdkInitializer {
  static const String appKey = "bfd373d3ca2afd5d0a9251c3";

  static const String appSerect = "bfd373d3ca2afd5d0a9251c3";

  // JPush jPush = JPush();
  @override
  bool hasInited = false;

  @override
  void init() {
    // jPush.setup(
    //     appKey: appKey,
    //     production: true,
    //     channel: "developer-default",
    //     debug: true);
    hasInited = true;
  }

  @override
  void release() {
    // jPush = null;
    hasInited = false;
  }
}
