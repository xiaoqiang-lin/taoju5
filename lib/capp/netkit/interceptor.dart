/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-20 11:45:53
 * @LastEditTime: 2021-04-20 11:58:32
 */
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/capp/entity/base_entity.dart';
import 'package:taoju5/config/app_manager.dart';

import 'exception.dart';

int _cConnectTimeout = 1000 * 45;
int _cReceiveTimeout = 1000 * 45;

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.connectTimeout = _cConnectTimeout;
    options.receiveTimeout = _cReceiveTimeout;
    String appInfo = await AppManager.getAppInfo();

    ///添加设备信息
    options.headers.addAll({"equipment": appInfo});
    handler.next(options);
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint("请求时间:${DateTime.now()}");
    debugPrint('---api-请求地址--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}----formdata:${options.data}');
//    debugPrint('---api-request--->data--->${options.data}');
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
//    debugPrint('---api-response--->resp----->${response.data}');
    BaseEntity entity = BaseEntity.fromJson(response.data);

    ///首先判断是否授权
    if (entity.unAuthed) {
      throw const UnAuthorizedException(); // 需要登录
    }
    if (entity.success) {
      response.data = entity;
      handler.next(response);
    }
    throw NetErrorException.fromMessage(entity.message);
  }
}
