/*
 * @Description: 设置通用组件
 * @Author: iamsmiling
 * @Date: 2021-04-14 17:42:39
 * @LastEditTime: 2021-05-17 15:34:10
 */
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/login/dialog/open_user_auth_diaolog.dart';

class SettingTileEntity {
  final String label;
  final Function()? onTap;

  SettingTileEntity({required this.label, required this.onTap});
}

class SettingController extends GetxController {
  List<SettingTileEntity> accountGroup = [
    SettingTileEntity(
        label: "账号安全",
        onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.account)),
    SettingTileEntity(label: "向朋友推荐淘居屋", onTap: () {}),
  ];

  List<SettingTileEntity> appGroup = [
    SettingTileEntity(
        label: "清除缓存", onTap: () => openUserAuthDialog(Get.context!)),
    SettingTileEntity(label: "检查更新", onTap: () {}),
    SettingTileEntity(
        label: "关于淘居屋",
        onTap: () => Get.toNamed(
            AppRoutes.mine + AppRoutes.setting + AppRoutes.aboutApp)),
    SettingTileEntity(label: "淘居屋用户协议", onTap: () {}),
  ];
}
