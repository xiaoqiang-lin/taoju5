/*
 * @Description: 请求数据拦截器
 * @Author: iamsmiling
 * @Date: 2021-04-27 10:09:54
 * @LastEditTime: 2021-04-27 10:17:06
 */
import 'dart:convert';

import 'package:dio/dio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';

class ResponseInterceptor extends InterceptorsWrapper {
  bool _isThirdPartyUrl(String url) {
    return !url.startsWith(AppConfig.baseUrl);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    dynamic data = response.data;
    data = data is String ? jsonDecode(data) : data;
    if (_isThirdPartyUrl(response.realUri.toString())) {
      response.data = BaseEntity(data);
      // return Future.value(response);
    }
    BaseEntity entity = BaseEntity.fromJson(data);
    response.data = entity;
    handler.next(response);
  }
}
