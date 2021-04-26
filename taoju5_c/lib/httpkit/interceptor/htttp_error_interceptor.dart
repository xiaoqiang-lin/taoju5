/*
 * @Description: //TODO
 * @Author: iamsmiling
 * @Date: 2021-04-26 18:00:32
 * @LastEditTime: 2021-04-26 18:08:25
 */
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class HttpErrorInterceptor extends InterceptorsWrapper {
  HttpErrorInterceptor();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   return handler.resolve(new ResultData(
    //       Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
    //       false,
    //       Code.NETWORK_ERROR));
    // }
    // return options;
  }
}
