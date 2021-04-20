/*
 * @Description: 请求拦截器
 * @Author: iamsmiling
 * @Date: 2021-04-06 13:22:02
 * @LastEditTime: 2021-04-19 13:33:02
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/utils/toast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_config.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    // return options;
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  bool _isThirdPartyUrl(String url) {
    return !url.startsWith(AppConfig.baseUrl);
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//    debugPrint('---api-request--->data--->${options.data}');
    ///为每个请求添加token
    SharedPreferences _sp = await SharedPreferences.getInstance();
    String? token = _sp.getString("token");
    options.queryParameters.addAll({"token": token});
    debugPrint("请求时间:${DateTime.now()}");
    debugPrint('---api-请求地址--->url--> ${options.baseUrl}${options.path}\n' +
        ' queryParameters: ${options.queryParameters}----formdata:${options.data}');
    handler.next(options);
    // return options;
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('---api-response--->resp----->${response.data}');
    dynamic data = response.data;
    data = data is String ? jsonDecode(data) : data;
    if (_isThirdPartyUrl(response.realUri.toString())) {
      response.data = BaseEntity(data);
      // return Future.value(response);
    }
    BaseEntity entity = BaseEntity.fromJson(data);

    ///首先判断是否授权
    if (entity.unAuthed) {
      throw const UnAuthorizedException(); // 需要登录
    }
    if (entity.success) {
      response.data = entity;
      // return Future.value(response);
    } else {
      throw ToastKit.error(entity.message);
    }
    handler.next(response);
  }
}
