/*
 * @Description: sdk管理
 * @Author: iamsmiling
 * @Date: 2020-12-16 10:15:07
 * @LastEditTime: 2021-02-02 17:30:42
 */

import 'package:taoju5/config/sdk_manager/sdk/bugly_sdk.dart';
import 'package:taoju5/config/sdk_manager/sdk/jpush_sdk.dart';
import 'package:taoju5/config/sdk_manager/sdk/wechat_sdk.dart';

import 'i_sdk_initializer.dart';

class SdkManager implements ISdkInitializer {
  @override
  bool hasInited;

  static SdkManager _singleton = SdkManager._();

  // 工厂方法
  factory SdkManager() => _singleton;
  SdkManager._();

  /// 初始化器列表
  List<ISdkInitializer> _sdkList = [BuglySdk(), WeChatSdk(), JPushSdk()];
  @override
  void init() {
    for (ISdkInitializer initialzer in _sdkList) {
      //如果sdk 已经被初始化过则是那么页不做
      // ignore: unnecessary_statements
      initialzer.hasInited ? '' : initialzer.init();
    }
    hasInited = false;
  }

  /// 注册sdk
  void register(ISdkInitializer initialzer) {
    _sdkList.add(initialzer);
  }

  @override
  void release() {
    for (ISdkInitializer initialzer in _sdkList) {
      //如果sdk 已经被初始化过则是那么页不做
      // ignore: unnecessary_statements
      initialzer.hasInited ? '' : initialzer.release();
    }
    hasInited = false;
  }
}
