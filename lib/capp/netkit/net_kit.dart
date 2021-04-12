import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:taoju5/capp/entity/base_entity.dart';
import 'package:taoju5/capp/netkit/exception.dart';
import 'package:taoju5/capp/utils/toast.dart';
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
class NetKit {
  static NetKit _singleton = NetKit._();

  factory NetKit() => _singleton;

  Dio dio;

  NetKit._() {
    dio = Dio();

    dio.options = BaseOptions(baseUrl: "");

    ///在isolate中进行数据解析
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    ///为每个请求添加头部
    dio.interceptors.add(HeaderInterceptor());

    ///打印请求信息
    dio.interceptors.add(ApiInterceptor());
  }

  Future<BaseEntity> get(String url, {Map params, Options options}) async {
    return dio
        .get(url, queryParameters: params, options: options)
        .then((Response response) {
      return response.data;
    }).catchError((err) {
      setError(err);
      throw err;
    });
  }

  Future<BaseEntity> post(String url,
      {Map params, Options options, Map formData}) async {
    return dio
        .post(url, queryParameters: params, data: formData, options: options)
        .then((Response response) {
      return response.data;
    }).catchError((err) {
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
    if (e is DioError) {
      ToastKit.error("连接失败");
    }
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
