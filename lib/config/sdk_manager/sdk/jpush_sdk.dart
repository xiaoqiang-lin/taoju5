import 'package:taoju5/config/sdk_manager/i_sdk_initializer.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JPushSdk implements ISdkInitializer {
  static const String appKey = "bfd373d3ca2afd5d0a9251c3";

  static const String appSerect = "bfd373d3ca2afd5d0a9251c3";

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
