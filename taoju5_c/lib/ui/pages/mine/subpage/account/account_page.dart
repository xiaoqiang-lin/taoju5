/*
 * @Description: 账号安全
 * @Author: iamsmiling
 * @Date: 2021-04-14 18:04:14
 * @LastEditTime: 2021-04-15 17:43:02
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

import 'package:taoju5_c/routes/capp_routes.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/widget/setting_tile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static List<SettingTileEntity> tiles = [
    SettingTileEntity(
        label: "修改手机号", onTap: () => Get.toNamed(AppRoutes.modifyTelephone1)),
    SettingTileEntity(
        label: "修改密码", onTap: () => Get.toNamed(AppRoutes.modifyPassword1)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账号安全"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
        child: Column(
          children: [
            for (SettingTileEntity item in tiles) SettingListTile(entity: item)
          ],
        ),
      ),
    );
  }
}
