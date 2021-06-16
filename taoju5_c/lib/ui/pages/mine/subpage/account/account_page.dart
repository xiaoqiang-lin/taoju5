/*
 * @Description: 账号安全
 * @Author: iamsmiling
 * @Date: 2021-04-14 18:04:14
 * @LastEditTime: 2021-06-07 14:42:02
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/account/account_controller.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/widget/setting_tile.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

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
            for (SettingTileEntity item in controller.tiles)
              SettingListTile(entity: item)
          ],
        ),
      ),
    );
  }
}
