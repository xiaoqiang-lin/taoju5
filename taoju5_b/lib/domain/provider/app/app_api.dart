/*
 * @Description: [app]相关的网络请求
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:53:24
 * @LastEditTime: 2021-04-17 17:29:27
 */

import 'package:taoju5_b/xdio/x_dio.dart';

class AppAPI {
  Future<BaseResponse> appInfo({Map params}) =>
      XDio().get("/api/Config/getAppUpgradeInfo", params: params);

  Future<BaseResponse> upgradeApp(String url, {Map params}) =>
      XDio().get(url, params: params);
}
