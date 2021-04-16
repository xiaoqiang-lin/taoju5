/*
 * @Description: 网络请求封装
 * @Author: iamsmiling
 * @Date: 2021-03-30 21:39:00
 * @LastEditTime: 2021-04-15 16:21:00
 */
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:taoju5/capp/domain/entity/base_entity.dart';
import 'package:taoju5/capp/netkit/exception.dart';
import 'package:taoju5/capp/utils/toast.dart';
import 'package:taoju5/config/app_config.dart';
import 'interceptor.dart';

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

  Dio dio;

  HttpKit._() {
    dio = Dio();

    dio.options = BaseOptions(baseUrl: AppConfig.baseUrl);

    ///在isolate中进行数据解析
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    ///为每个请求添加头部
    dio.interceptors.add(HeaderInterceptor());

    ///打印请求信息
    dio.interceptors.add(ApiInterceptor());
  }

  Future<CBaseEntity> get(String url, {Map params, Options options}) async {
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

  Future<CBaseEntity> post(String url,
      {Map params, Options options, Map formData}) async {
    return dio
        .post(url,
            queryParameters: params?.cast<String, dynamic>(),
            data: formData?.cast<String, dynamic>(),
            options: options)
        .then((Response response) {
      return response.data;
    }, onError: (err) {
      setError(err);
      throw err;
    });
  }

  /// [e]分类Error和Exception两种
  void setError(e, {String message}) {
    printErrorStack(e);
    if (e is UnAuthorizedException) {}
    if (e is NetErrorException) {
      ToastKit.error(message);
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
