// import 'package:taoju5/config/app_config.dart';
import 'package:taoju5/config/sdk_manager/i_sdk_initializer.dart';
// import 'package:amap_location/amap_location.dart';

class AmapSdk implements ISdkInitializer {
  @override
  bool hasInited = false;

  @override
  void init() {
    // AMapLocationClient.setApiKey(AppConfig.amapAndroidKey);
    hasInited = true;
  }

  @override
  void release() {
    // AMapLocationClient.shutdown();
    hasInited = false;
  }
}
