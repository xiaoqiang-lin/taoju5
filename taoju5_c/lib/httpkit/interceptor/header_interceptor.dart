/*
 * @Description: 头部拦截器
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:55:53
 * @LastEditTime: 2021-04-27 10:20:47
 */
import 'package:dio/dio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_manager.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    ///超时
    options.connectTimeout = 30000;
    options.receiveTimeout = 30000;
    String appInfo = await AppManager.getAppInfo();

    ///添加设备信息
    options.headers.addAll({"equipment": appInfo});
    handler.next(options);
  }
}
