/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-06-07 14:37:20
 * @LastEditTime: 2021-06-07 15:22:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_controller.dart';

class AccountController extends GetxController {
  UserEntity user = Get.arguments;
  List<SettingTileEntity> get tiles => [
        user.registerType == RegisterType.telephone
            ? SettingTileEntity(
                label: "修改手机号",
                onTap: () =>
                    Get.toNamed(AppRoutes.modifyTelephone1, arguments: user))
            : SettingTileEntity(
                label: "绑定手机号",
                onTap: () =>
                    Get.toNamed(AppRoutes.bindTelephone, arguments: user)),
        user.isPasswordEmpty
            ? SettingTileEntity(
                label: "设置密码",
                onTap: () => Get.toNamed(AppRoutes.setPassword, arguments: user)
                    ?.then((value) => {
                          if (value) {user.isPasswordEmpty = false}
                        })
                    .whenComplete(update))
            : SettingTileEntity(
                label: "修改密码",
                onTap: () =>
                    Get.toNamed(AppRoutes.modifyPassword1, arguments: user)),
      ];
}
