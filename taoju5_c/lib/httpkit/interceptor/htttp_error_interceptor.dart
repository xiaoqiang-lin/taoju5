/*
 * @Description: 网络错误拦截
 * @Author: iamsmiling
 * @Date: 2021-04-26 18:00:32
 * @LastEditTime: 2021-04-28 09:57:56
 */
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/exception/expired_token_exception.dart';
import 'package:taoju5_c/httpkit/exception/invalid_params_exception.dart';
import 'package:taoju5_c/httpkit/exception/offline_exception.dart';
import 'package:taoju5_c/httpkit/exception/unlogin_exception.dart';
import 'package:taoju5_c/httpkit/taoju5_http_code.dart';

class HttpErrorInterceptor extends InterceptorsWrapper {
  HttpErrorInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(OfflineException("网络开小差了，点击屏幕重新加载~", options));
    }
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    BaseEntity result = response.data;

    int code = result.code;

    if (code == Taoju5HttpStatus.unLogin.code) {
      return handler
          .reject(UnLoginException(result.message, response.requestOptions));
    }
    if (code == Taoju5HttpStatus.inValidToken.code) {
      return handler.reject(
          ExpiredTokenException(result.message, response.requestOptions));
    }
    if (code == Taoju5HttpStatus.invalidParams.code) {
      return handler.reject(
          InvalidParamsException(result.message, response.requestOptions));
    }
    handler.next(response);
  }
}
