/*
 * @Description: 本地存储
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:22:40
 * @LastEditTime: 2021-04-27 14:34:45
 */

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetS extends GetxService {
  late SharedPreferences prefs;

  bool authed = false;

  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      authed = prefs.getBool("token") != null;
    });
    print("出111111111111111111");
    super.onInit();
  }
}
