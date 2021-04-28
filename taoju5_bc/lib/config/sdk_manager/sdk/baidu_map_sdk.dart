/*
 * @Description: 百度地图
 * @Author: iamsmiling
 * @Date: 2021-04-28 16:37:39
 * @LastEditTime: 2021-04-28 16:46:10
 */

import 'dart:io';

import 'package:taoju5_bc/config/sdk_manager/i_sdk_initializer.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;

class BaiduMapSdk implements ISdkInitializer {
  @override
  bool hasInited = false;

  @override
  void init() {
    hasInited = true;
    if (Platform.isIOS) {
      BMFMapSDK.setApiKeyAndCoordType(
          'wOl1VRZZRv0Q8XUALbiouIICTHLC6FpG', BMF_COORD_TYPE.BD09LL);
    } else if (Platform.isAndroid) {
// Android 目前不支持接口设置Apikey,
// 请在主工程的Manifest文件里设置，详细配置方法请参考[https://lbsyun.baidu.com/ 官网][https://lbsyun.baidu.com/)demo
      BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
    }
  }

  @override
  void release() {
    hasInited = false;
  }
}
