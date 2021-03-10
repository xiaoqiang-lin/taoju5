/*
 * @Description: 基于dio的二次封装
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:34:12
 * @LastEditTime: 2021-01-26 14:42:02
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/utils.dart';
import 'package:taoju5/storage/storage_manager.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:taoju5/utils/x_logger.dart';
import 'package:taoju5/config/net_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class XDio {
  // 私有构造函数
  // netconfig 网络配置相关
  NetConfig netConfig;
  // dio 实例
  Dio dio;

  XDio._internal() {
    netConfig = NetConfig(headers: {});
    String token = StorageManager().sharedPreferences?.getString("token");
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: NetConfig.baseUrl,
          queryParameters: {"token": token},
          connectTimeout: netConfig.timeout,
          receiveTimeout: netConfig.timeout)
      ..interceptors.add(InterceptorsWrapper(
        onError: (DioError error) {
          return error;
        },
        onRequest: ((RequestOptions options) {
          Map queryParameters = options.queryParameters;
          options.queryParameters = _formatParams(queryParameters);
          // var formData = options.data;
          // options.data = _formatParams(formData);
          print(DateTime.now());
          print("--------------请求地址----------------");
          XLogger.v("${options.baseUrl + options.path}");
          XLogger.v("====================query请求参数===========================");
          XLogger.v("${options.queryParameters}");
          XLogger.v(
              "+++++++++++++++++++++++++formData参数+++++++++++++++++++++++++");
          XLogger.v("${options.data}");

          return options;
        }),
        onResponse: (Response response) {
          response.data = jsonDecode(response.toString());
          BaseResponse baseResponse = BaseResponse.fromJson(response.data);
          if (response.data is Map) {
            // response.data = JsonKit.normalize(response.data);
            print(response.data);
          }
          if (!baseResponse.isValid) {
            EasyLoading.showInfo(baseResponse.message);
          }
          XLogger.e(
              "*******************************请求结果*******************************\n${response.data}");
          return response;
        },
      ))
      ..interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: NetConfig.baseUrl)).interceptor);
  }
  static XDio _singleton = XDio._internal();
  factory XDio() => _singleton;

  Map _formatParams(Map map) {
    if (map == null) return {};
    List list = map.values?.toList();
    if (GetUtils.isNullOrBlank(list)) return {};
    for (int i = 0; i < list.length; i++) {
      var v = list[i];
      if (GetUtils.isNullOrBlank(v) || v == "null") {
        map.remove(map.keys.toList()[i]);
      }
    }
    return map;
  }

  Future<BaseResponse> get(String url, {Map params, Options options}) async {
    Response response = await dio.get(url,
        queryParameters: params?.cast<String, dynamic>(), options: options);
    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse> post<T>(String url,
      {Map queryParameters, var formData, Options options}) async {
    Response response = await dio.post<T>(url,
        queryParameters: queryParameters?.cast<String, dynamic>(),
        options: options,
        data: formData);
    return BaseResponse.fromJson(response.data);
  }

  ///刷新token
  void refreshToken(String token) {
    dio.options.queryParameters = {"token": token};
  }
}

class BaseResponse {
  int code;
  dynamic data;
  String message;

  bool get isValid => code == 0;

  BaseResponse.fromJson(Map json) {
    code = JsonKit.asInt(json['code']);
    data = json['data'];
    message = json['message'];
  }
}
