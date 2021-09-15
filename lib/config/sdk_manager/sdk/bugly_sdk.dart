/*
 * @Description: bugly sdk
 * @Author: iamsmiling
 * @Date: 2020-12-16 10:38:15
 * @LastEditTime: 2021-09-11 14:01:31
 */

// import 'package:flutter_bugly/flutter_bugly.dart';

import '../i_sdk_initializer.dart';

class BuglySdk implements ISdkInitializer {
  @override
  bool hasInited = false;

  @override
  void init() {
    if (hasInited) return;
    // FlutterBugly.init(
    //     androidAppId: AppConfig.buglyAndroidAppId,
    //     iOSAppId: AppConfig.buglyIosAppId);
    hasInited = true;
  }

  @override
  void release() {
    // FlutterBugly.dispose();
    hasInited = false;
  }
}
