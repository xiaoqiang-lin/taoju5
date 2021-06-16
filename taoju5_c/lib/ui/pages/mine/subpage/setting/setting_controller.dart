/*
 * @Description: 设置通用组件
 * @Author: iamsmiling
 * @Date: 2021-04-14 17:42:39
 * @LastEditTime: 2021-06-08 10:52:36
 */
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_manager.dart';
import 'package:taoju5_c/local_storage/local_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/dialog/app_update_dialog.dart';
import 'package:taoju5_c/ui/dialog/clean_cache_dialog.dart';

class SettingTileEntity {
  final String label;
  final Function()? onTap;
  String value;

  SettingTileEntity(
      {required this.label, required this.onTap, this.value = ""});
}

class SettingController extends GetxController {
  List<SettingTileEntity> accountGroup = [];

  List<SettingTileEntity> appGroup = [];

  late SettingTileEntity cacheEntity;
  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() {
    cacheEntity = SettingTileEntity(
        label: "清除缓存",
        value: "0kb",
        onTap: () => openCleanCacheDialog(Get.context!, onCleanCache: () {
              AppManager.clearCache().then((value) {
                cacheEntity.value = "0kb";
              }).whenComplete(update);
            }));
    appGroup = [
      cacheEntity,
      SettingTileEntity(
          label: "检查更新",
          onTap: () async {
            bool hasNewVersion = await AppManager.hasNewAppVersion();
            if (!hasNewVersion) return;
            bool? shouldUpdate = await openAppUpdateDialog(Get.context!,
                app: AppManager.appInfoModel);
            if (shouldUpdate == true) {}
          }),
      SettingTileEntity(
          label: "关于淘居屋",
          onTap: () => Get.toNamed(
              AppRoutes.mine + AppRoutes.setting + AppRoutes.aboutApp)),
      SettingTileEntity(label: "淘居屋用户协议", onTap: () {}),
    ];
    accountGroup = [
      SettingTileEntity(
          label: "账号安全",
          onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.account,
              arguments: Get.arguments)),
      SettingTileEntity(label: "向朋友推荐淘居屋", onTap: () {}),
    ];
    AppManager.loadCache().then((value) {
      cacheEntity.value = value;
    }).whenComplete(update);
  }

  void logout() {
    LocalStorage.remove("token").then((_) {
      Get.offAllNamed(AppRoutes.loginGuide);
    });
  }
}
