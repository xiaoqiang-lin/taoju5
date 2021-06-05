/*
 * @Description: 本地存储
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:22:40
 * @LastEditTime: 2021-06-03 15:14:27
 */

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocalStorage extends GetxService {
  late SharedPreferences prefs;

  bool authed = false;

  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      authed = prefs.getBool("token") != null;
      print(authed);
      print("是否登录");
    });

    super.onInit();
  }
}
