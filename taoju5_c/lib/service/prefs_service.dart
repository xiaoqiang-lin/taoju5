/*
 * @Description: 本地存储
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:22:40
 * @LastEditTime: 2021-06-07 09:45:37
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
      authed = prefs.getBool("ctoken") != null;
    });

    super.onInit();
  }
}
