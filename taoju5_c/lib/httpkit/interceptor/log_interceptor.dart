/*
 * @Description: 日志打印
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:58:16
 * @LastEditTime: 2021-05-27 09:18:17
 */
import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {
  LogInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("请求时间:${DateTime.now()}");
    print("请求地址:${options.baseUrl + options.path}");
    print("query参数:\n");
    print("${options.queryParameters}");
    print("formdata参数:\n");
    print("${options.data}");
    print("----------------------------------------------------------------");

    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    print("-------------${response.realUri}:网络请求返回数据--------");
    print(response.data);
    handler.next(response);
  }
}
