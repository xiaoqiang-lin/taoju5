/*
 * @Description: 设置通用组件
 * @Author: iamsmiling
 * @Date: 2021-04-14 17:42:39
 * @LastEditTime: 2021-04-15 17:42:11
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/routes/capp_routes.dart';

class CSettingTileEntity {
  final String label;
  final Function onTap;

  CSettingTileEntity({@required this.label, @required this.onTap});
}

class CSettingController extends GetxController {
  List<CSettingTileEntity> accountGroup = [
    CSettingTileEntity(
        label: "账号安全",
        onTap: () => Get.toNamed(CAppRoutes.mine + CAppRoutes.account)),
    CSettingTileEntity(label: "向朋友推荐淘居屋", onTap: () {}),
  ];

  List<CSettingTileEntity> appGroup = [
    CSettingTileEntity(label: "清除缓存", onTap: () {}),
    CSettingTileEntity(label: "检查更新", onTap: () {}),
    CSettingTileEntity(label: "关于淘居屋", onTap: () {}),
    CSettingTileEntity(label: "淘居屋用户协议", onTap: () {}),
  ];
}
