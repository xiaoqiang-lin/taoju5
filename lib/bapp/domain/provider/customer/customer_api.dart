/*
 * @Description: 客户相关api
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:09:48
 * @LastEditTime: 2021-01-12 17:13:32
 */

import 'package:taoju5/xdio/x_dio.dart';

class CustomerAPI {
  Future<BaseResponse> customerList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> categoryCustomerList(String url, {Map params}) =>
      XDio().get(url, params: params);
  Future<BaseResponse> customerDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> editCustomer(String url, {Map params}) =>
      XDio().post(url, formData: params, queryParameters: params);
}
