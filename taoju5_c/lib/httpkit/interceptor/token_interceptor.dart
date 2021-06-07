/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:38:48
 * @LastEditTime: 2021-06-07 09:31:06
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taoju5_c/local_storage/local_storage.dart';
import 'package:taoju5_c/service/prefs_service.dart';

import 'package:get/get.dart' as g;

class TokenInterceptor extends InterceptorsWrapper {
  List<String> _noTokenUrls = [
    "/app/login/sendConsumerPhoneCode",
    "/app/login/login",
    "/app/login/weChatLogin"
  ];

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_noTokenUrls.contains(options.path)) {
      var token = await LocalStorage.get("ctoken");
      options.queryParameters.addAll({"ctoken": token});
    }
    handler.next(options);
  }

  clearToken() {
    LocalStorage.remove("ctoken");
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.realUri.toString().contains("/login")) {
      var json = jsonDecode(response.data);
      String token = json["data"] ?? "";
      if (response.statusCode == 200 && token.isNotEmpty) {
        await LocalStorage.save("ctoken", token);

        g.Get.find<GetLocalStorage>().authed = true;
      }
    }

    handler.next(response);
  }
}
