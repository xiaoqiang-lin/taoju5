/*
 * @Description: 设置通用组件
 * @Author: iamsmiling
 * @Date: 2021-04-14 17:42:39
 * @LastEditTime: 2021-04-17 18:26:18
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/capp_routes.dart';

class SettingTileEntity {
  final String label;
  final Function onTap;

  SettingTileEntity({@required this.label, @required this.onTap});
}

class SettingController extends GetxController {
  List<SettingTileEntity> accountGroup = [
    SettingTileEntity(
        label: "账号安全",
        onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.account)),
    SettingTileEntity(label: "向朋友推荐淘居屋", onTap: () {}),
  ];

  List<SettingTileEntity> appGroup = [
    SettingTileEntity(label: "清除缓存", onTap: () {}),
    SettingTileEntity(label: "检查更新", onTap: () {}),
    SettingTileEntity(label: "关于淘居屋", onTap: () {}),
    SettingTileEntity(label: "淘居屋用户协议", onTap: () {}),
  ];
}
