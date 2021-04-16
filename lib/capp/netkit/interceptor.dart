/*
 * @Description: 请求拦截器
 * @Author: iamsmiling
 * @Date: 2021-04-06 13:22:02
 * @LastEditTime: 2021-04-16 17:07:30
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/capp/domain/entity/base_entity.dart';
import 'package:taoju5/capp/utils/toast.dart';
import 'package:taoju5/config/app_config.dart';
import 'package:taoju5/config/app_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'exception.dart';

int _cConnectTimeout = 1000 * 45;
int _cReceiveTimeout = 1000 * 45;

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    options.connectTimeout = _cConnectTimeout;
    options.receiveTimeout = _cReceiveTimeout;
    String appInfo = await AppManager.getAppInfo();

    ///添加设备信息
    options.headers.addAll({"equipment": appInfo});
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  bool _isThirdPartyUrl(String url) {
    return !url.startsWith(AppConfig.baseUrl);
  }

  @override
  onRequest(RequestOptions options) async {
//    debugPrint('---api-request--->data--->${options.data}');
    ///为每个请求添加token
    SharedPreferences _sp = await SharedPreferences.getInstance();
    String token = _sp.getString("token");
    options.queryParameters.addAll({"token": token});
    debugPrint("请求时间:${DateTime.now()}");
    debugPrint('---api-请求地址--->url--> ${options.baseUrl}${options.path}\n' +
        ' queryParameters: ${options.queryParameters}----formdata:${options.data}');
    return options;
  }

  @override
  onResponse(Response response) {
    debugPrint('---api-response--->resp----->${response.data}');
    dynamic data = response.data;
    data = data is String ? jsonDecode(data) : data;
    if (_isThirdPartyUrl(response.request.uri.toString())) {
      response.data = CBaseEntity(data);
      return Future.value(response);
    }
    CBaseEntity entity = CBaseEntity.fromJson(data);

    ///首先判断是否授权
    if (entity.unAuthed) {
      throw const UnAuthorizedException(); // 需要登录
    }
    if (entity.success) {
      response.data = entity;
      return Future.value(response);
    } else {
      throw ToastKit.error(entity.message);
    }
  }
}
