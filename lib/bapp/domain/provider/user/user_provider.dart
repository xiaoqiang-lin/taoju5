/*
 * @Description: 用户相关的网络接口
 * @Author: iamsmiling
 * @Date: 2021-01-21 14:29:10
 * @LastEditTime: 2021-01-21 14:34:02
 */

import 'package:taoju5/xdio/x_dio.dart';

class UserProvider {
  Future<BaseResponse> userInfo(String url, {Map params}) =>
      XDio().get(url, params: params);
}
