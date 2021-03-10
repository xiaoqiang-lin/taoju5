/*
 * @Description: 用户信息
 * @Author: iamsmiling
 * @Date: 2020-12-30 16:52:38
 * @LastEditTime: 2021-01-29 11:00:15
 */

import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/user/user_info_model.dart';
import 'package:taoju5/bapp/domain/repository/user/user_repository.dart';
import 'package:taoju5/storage/storage_manager.dart';

class UserProviderController extends GetxController {
  UserRepository _repository = UserRepository();
  UserInfoModel user;
  String greetWord;
  String token;
  String _getGreetWord({DateTime time}) {
    // 6-12 上午好 // 12-18 下午好
    time ??= DateTime.now();
    int h = time.hour + 1;
    if (6 < h && h < 13) return '上午好';
    if (13 <= h && h < 19) return '下午好';
    return '晚上好';
  }

  @override
  void onInit() {
    greetWord = _getGreetWord();
    StorageManager storageManager = StorageManager();
    Map json =
        jsonDecode(storageManager.sharedPreferences?.get("userInfo") ?? "{}");
    user = GetUtils.isNullOrBlank(json) ? null : UserInfoModel.fromJson(json);
    token = user?.token;
    loadData();
    super.onInit();
  }

  void loadData({Map params}) {
    if (user != null || token == null) return;
    _repository.userInfo().then((UserInfoModel model) {
      user = model;
      update();
    });
  }
}
