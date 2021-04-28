/*
 * @Description: 网络请求封装
 * @Author: iamsmiling
 * @Date: 2021-03-30 21:39:00
 * @LastEditTime: 2021-04-27 10:41:18
 */
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:taoju5_c/httpkit/interceptor/htttp_error_interceptor.dart';
import 'package:taoju5_c/httpkit/interceptor/response_interceptor.dart';
import 'package:taoju5_c/httpkit/interceptor/token_interceptor.dart';
import 'interceptor/log_interceptor.dart' as taoju5;
import 'package:taoju5_c/utils/toast.dart';
import 'interceptor/header_interceptor.dart';

// 必须是顶层函数
_parseData(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseData, text);
}

/// 错误类型
enum FutureLoadStateErrorType {
  defaultError,
  networkTimeOutError, //网络错误
  unauthorizedError //为授权(一般为未登录)
}

/// [code]状态码
class HttpKit {
  static HttpKit _singleton = HttpKit._();

  factory HttpKit() => _singleton;

  late Dio dio;

  HttpKit._() {
    dio = Dio();

    dio.options = BaseOptions(baseUrl: AppConfig.baseUrl);

    ///在isolate中进行数据解析
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    ///为每个请求添加头部
    dio.interceptors.add(HeaderInterceptor());

    ///token
    dio.interceptors.add(TokenInterceptor());

    ///打印
    dio.interceptors.add(taoju5.LogInterceptor());

    ///网络请求
    dio.interceptors.add(ResponseInterceptor());

    ///打印请求信息
    dio.interceptors.add(HttpErrorInterceptor());
  }

  Future<BaseEntity> get(String url, {Map? params, Options? options}) async {
    return dio
        .get(url,
            queryParameters: params?.cast<String, dynamic>(), options: options)
        .then((Response response) {
      return response.data;
    }, onError: (err) {
      setError(err);
      throw err;
    });
  }

  Future<BaseEntity> post(String url,
      {Map? params, Options? options, dynamic formData}) async {
    return dio
        .post(url,
            queryParameters: params?.cast<String, dynamic>(),
            data: formData is Map ? formData.cast<String, dynamic>() : formData,
            options: options)
        .then((Response response) {
      return response.data;
    }, onError: (err) {
      setError(err);
      throw err;
    });
  }

  /// [e]分类Error和Exception两种
  void setError(e, {String? message}) {
    if (e is BaseHttpException) {
      if (!e.noTip) {
        ToastKit.error(e.message);
      }
      print(e.message);
      e.onException();
    }
    // if (e is DioError) {
    //   ToastKit.error("连接失败");
    // }
  }

  /// [e]为错误类型 :可能为 Error , Exception ,String
  /// [s]为堆栈信息
  printErrorStack(e) {
    debugPrint('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  }
}
