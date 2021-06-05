/*
 * @Description: 基于dio的二次封装
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:34:12
 * @LastEditTime: 2021-06-04 15:56:25
 */

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5_bc/config/net_config.dart';
import 'package:taoju5_bc/storage/storage_manager.dart';
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_bc/utils/x_logger.dart';

class XDio {
  // 私有构造函数
  // netconfig 网络配置相关
  NetConfig netConfig;
  // dio 实例
  Dio dio;

  ///白名单里面的api不需要错误提示
  List<String> whiteList = [
    "/api/Config/getAppUpgradeInfo",
    "/api/goods/wcAttr"
  ];

  bool _isInWhiteList(String url) {
    return whiteList.any((e) => url.contains(e));
  }

  XDio._internal() {
    netConfig = NetConfig(headers: {});
    // String token = StorageManager().sharedPreferences?.getString("token");
    String token = "";
    String deviceInfo =
        StorageManager().sharedPreferences?.getString("device_info");
    Map<String, String> headers = {};
    if (g.GetPlatform.isAndroid || g.GetPlatform.isIOS) {
      headers = {
        'ACCEPT': 'application/json',
        'equipment': deviceInfo,
      };
    }

    dio = Dio()
      ..options = BaseOptions(
          baseUrl: NetConfig.baseUrl,
          headers: headers,
          queryParameters: {"token": token},
          connectTimeout: netConfig.timeout,
          receiveTimeout: netConfig.timeout)
      ..interceptors.add(InterceptorsWrapper(onError: (DioError err, _) {
        return err;
      }, onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
        // Map queryParameters = options.queryParameters;
        // options.queryParameters = _formatParams(queryParameters);
        // var formData = options.data;
        // if (formData is Map) {
        //   options.data = _formatParams(formData);
        // }
        XLogger.v("${options.baseUrl + options.path}");
        XLogger.v("====================query请求参数===========================");
        XLogger.v("${options.queryParameters}");
        XLogger.v(
            "+++++++++++++++++++++++++formData参数+++++++++++++++++++++++++");
        XLogger.v("${options.data}");
        handler.next(options);
      }, onResponse: (Response response, ResponseInterceptorHandler handler) {
        response.data = jsonDecode(response.toString());
        BaseResponse baseResponse = BaseResponse.fromJson(response.data);

        XLogger.e(
            "*******************************请求结果*******************************\n${response.data}");
        if (!baseResponse.isValid &&
            !_isInWhiteList(response.requestOptions.path)) {
          throw EasyLoading.showInfo(baseResponse.message,
              duration: Duration(milliseconds: 1500));
        }
        if (baseResponse.data == null || baseResponse.data == null.toString()) {
          throw baseResponse.message;
        }
        response.data = baseResponse;
        if (baseResponse.data is Map) {
          // baseResponse.data = JsonKit.normalize(baseResponse.data);
          print(response.data);
        }
        handler.next(response);

        // if (baseResponse.data is Map) {
        //   // baseResponse.data = JsonKit.normalize(baseResponse.data);
        //   print(response.data);
        // }
      }
          // onRequest: ((RequestOptions options, _) {
          // Map queryParameters = options.queryParameters;
          // options.queryParameters = _formatParams(queryParameters);
          // var formData = options.data;
          // if (formData is Map) {
          //   options.data = _formatParams(formData);
          // }
          // print(DateTime.now());
          // print("--------------请求地址----------------");
          // XLogger.v("${options.baseUrl + options.path}");
          // XLogger.v("====================query请求参数===========================");
          // XLogger.v("${options.queryParameters}");
          // XLogger.v(
          //     "+++++++++++++++++++++++++formData参数+++++++++++++++++++++++++");
          // XLogger.v("${options.data}");

          //   return options;
          // }),
          // onResponse: (Response response) {
          //   response.data = jsonDecode(response.toString());

          //   BaseResponse baseResponse = BaseResponse.fromJson(response.data);
          //   XLogger.e(
          //     "*******************************请求结果*******************************\n${response.data}");
          // if (!baseResponse.isValid && !_isInWhiteList(response.request.path)) {
          //   throw EasyLoading.showInfo(baseResponse.message,
          //       duration: Duration(milliseconds: 1500));
          // }
          // if (baseResponse.data == null ||
          //     baseResponse.data == null.toString()) {
          //   // throw baseResponse.message;
          // }
          // response.data = baseResponse;
          // if (baseResponse.data is Map) {
          //   // baseResponse.data = JsonKit.normalize(baseResponse.data);
          //   print(response.data);
          // }

          // return response;
          // },
          ));
    // ..interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: NetConfig.baseUrl)).interceptor);
  }
  static XDio _singleton = XDio._internal();
  factory XDio() => _singleton;

  // Map _formatParams(Map map) {
  //   if (map == null) return {};
  //   List list = map.values?.toList();
  //   if (GetUtils.isNullOrBlank(list)) return {};
  //   map.removeWhere((key, value) => GetUtils.isNullOrBlank(value));
  //   return map;
  // }

  Future<BaseResponse> get(String url, {Map params, Options options}) async {
    Response response = await dio.get(url,
        queryParameters: params?.cast<String, dynamic>(), options: options);
    return response.data;
  }

  Future<BaseResponse> post<T>(String url,
      {Map queryParameters, var formData, Options options}) async {
    Response response = await dio.post<T>(url,
        queryParameters: queryParameters?.cast<String, dynamic>(),
        options: options,
        data: formData);
    return response.data;
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
