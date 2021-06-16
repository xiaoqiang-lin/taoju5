/*
 * @Description: 极光推送
 * @Author: iamsmiling
 * @Date: 2021-03-01 16:01:26
 * @LastEditTime: 2021-06-16 17:34:27
 */
// import 'package:jpush_flutter/jpush_flutter.dart';

import 'package:taoju5_bc/config/sdk_manager/i_sdk_initializer.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JPushSdk implements ISdkInitializer {
  static const String appKey = "c35981f8bafb7c46f4f72909";

  static const String appSerect = "af713c3aedf12ad0908ad920";

  JPush jPush = JPush();
  @override
  bool hasInited = false;

  @override
  void init() {
    jPush.setup(
        appKey: appKey,
        production: true,
        channel: "developer-default",
        debug: true);

    hasInited = true;
  }

  @override
  void release() {
    jPush = null;
    hasInited = false;
  }
}
