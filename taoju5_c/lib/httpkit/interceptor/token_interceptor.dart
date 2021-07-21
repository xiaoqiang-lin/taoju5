/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:38:48
 * @LastEditTime: 2021-07-20 16:32:46
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taoju5_c/local_storage/local_storage.dart';

class TokenInterceptor extends InterceptorsWrapper {
  List<String> _noTokenUrls = [
    "/app/login/sendConsumerPhoneCode",
    "/app/login/login",
    "/app/login/weChatLogin",
  ];

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_noTokenUrls.contains(options.path)) {
      var token = await LocalStorage.get("token");
      options.queryParameters.addAll({
        "token":
            "MDAwMDAwMDAwMJjcemKSuIGetZ54rH53e6rAiXmVjbuGYY9ns9Gbi4XOgs11Y37LgWqzrnxlgHiLag"
      });
    }
    handler.next(options);
  }

  clearToken() {
    LocalStorage.remove("token");
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.realUri.toString().contains("/login")) {
      var json = jsonDecode(response.data);
      String token = json["data"] ?? "";
      if (response.statusCode == 200 && token.isNotEmpty) {
        await LocalStorage.save("token", token);
        await LocalStorage.save("authed", true);
      }
    }

    handler.next(response);
  }
}
