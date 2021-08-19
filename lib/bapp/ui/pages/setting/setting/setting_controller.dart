/*
 * @Description: SettingController
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:53:57
 * @LastEditTime: 2021-08-17 21:27:32
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/user/user_info_model.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/dialog/clear_cache.dart';
import 'package:taoju5/bapp/ui/dialog/logout.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5/storage/storage_manager.dart';
import 'package:taoju5/xdio/x_dio.dart';
import 'package:taoju5/config/app_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  String cacheSize = "";
  String versionCode = "";
  //清空信息
  void clear() {
    ///清空信息
    StorageManager().clear();
  }

  UserProviderController get userProviderController =>
      Get.find<UserProviderController>();

  void logOut() {
    showLogoutDialog(Get.context).then((value) async {
      if (value) {
        ///清除token
        XDio().refreshToken("");
        StorageManager().sharedPreferences.remove("token");
        await SharedPreferences.getInstance().then((instance) {
          instance.remove("token");
        });

        ///清空客户信息
        Get.find<CustomerProviderController>().clear();
        //页面跳转
        Get.offAllNamed(BAppRoutes.login);
        // Get.offAndToNamed(BAppRoutes.login);
      }
    }).whenComplete(update);
  }

  UserInfoModel get user => userProviderController.user;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  _init() async {
    await Future.wait([_getCacheSize(), _getVersionCode()]);
    update();
  }

  Future _getCacheSize() async {
    cacheSize = await AppManager.loadCache();
  }

  Future _getVersionCode() async {
    versionCode = await AppManager.getAppVersion();
  }

  Future clearCache() {
    return showClearCacheDialog(Get.context).then((value) {
      if (value == true) {
        AppManager.clearCache().whenComplete(() {
          cacheSize = "";
          update();
        });
      }
    });
  }
}
