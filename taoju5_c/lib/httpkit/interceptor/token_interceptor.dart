/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:38:48
 * @LastEditTime: 2021-07-30 14:37:24
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/storage/storage_manager.dart';

class TokenInterceptor extends InterceptorsWrapper {
  GetStorage storgae = GetStorage('c');

  List<String> _noTokenUrls = [
    "/app/login/sendConsumerPhoneCode",
    "/app/login/login",
    "/app/login/weChatLogin",
  ];

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_noTokenUrls.contains(options.path)) {
      var token = storgae.read("token");
      options.queryParameters.addAll({
        "token": token
        // "token":
        //     "MDAwMDAwMDAwMJjcemKSuIGetZ54rH53e6rAiXmVjbuGYY9ns9Gbi4XOgs11Y37LgWqzrnxlgHiLag"
      });
    }
    handler.next(options);
  }

  clearToken() {
    storgae.remove('token');
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.realUri.toString().contains("/login")) {
      var json = jsonDecode(response.data);
      String token = json["data"] ?? "";
      if (response.statusCode == 200 && token.isNotEmpty) {
        storgae.write("token", token);
        storgae.write("authed", true);
        await StorageManager().sharedPreferences.setString("ctoken", token);
      }
    }

    handler.next(response);
  }
}
