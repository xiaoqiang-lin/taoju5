/*
 * @Description: 账号安全
 * @Author: iamsmiling
 * @Date: 2021-04-14 18:04:14
 * @LastEditTime: 2021-04-15 17:43:02
 */
import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';

import 'package:taoju5/capp/routes/capp_routes.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/setting/setting_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/setting/widget/setting_tile.dart';

class CAccountPage extends StatelessWidget {
  const CAccountPage({Key key}) : super(key: key);

  static List<CSettingTileEntity> tiles = [
    CSettingTileEntity(
        label: "修改手机号", onTap: () => Get.toNamed(CAppRoutes.modifyTelephone1)),
    CSettingTileEntity(
        label: "修改密码", onTap: () => Get.toNamed(CAppRoutes.modifyPassword1)),
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
            for (CSettingTileEntity item in tiles)
              CSettingListTile(entity: item)
          ],
        ),
      ),
    );
  }
}
