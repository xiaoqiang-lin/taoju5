/*
 * @Description: 高德地图
 * @Author: iamsmiling
 * @Date: 2021-03-28 13:29:54
 * @LastEditTime: 2021-04-17 22:54:42
 */
// import 'package:amap_location/amap_location.dart';
// import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_bc/config/sdk_manager/i_sdk_initializer.dart';

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
