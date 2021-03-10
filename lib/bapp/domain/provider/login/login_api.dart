/*
 * @Description: 登录相关的api
 * @Author: iamsmiling
 * @Date: 2020-12-28 17:14:46
 * @LastEditTime: 2021-02-02 17:50:17
 */

import 'package:taoju5/xdio/x_dio.dart';

class LoginAPI {
  Future<BaseResponse> loginByPwd(String url, {Map params}) =>
      XDio().post(url, formData: params);

  Future<BaseResponse> loginBySms(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///获取验证码
  Future<BaseResponse> getSms(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///重置密码
  Future<BaseResponse> resetPassword(String url, {Map params}) =>
      XDio().post(url, formData: params);
}
