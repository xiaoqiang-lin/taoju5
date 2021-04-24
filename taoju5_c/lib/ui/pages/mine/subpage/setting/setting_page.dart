/*
 * @Description: 设置页面
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-22 13:45:57
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_controller.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/widget/setting_tile.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text("设置"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      for (SettingTileEntity item in _.accountGroup)
                        SettingListTile(entity: item)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp30),
                  child: Column(
                    children: [
                      for (SettingTileEntity item in _.appGroup)
                        SettingListTile(entity: item)
                    ],
                  ),
                ),
                Container(
                  child: PrimaryButton(
                      text: "退出登录",
                      size: PrimaryButtonSize.large,
                      mode: PrimaryButtonMode.outlinedButton,
                      margin: EdgeInsets.only(
                          top: R.dimen.dp100,
                          left: R.dimen.dp32,
                          right: R.dimen.dp32),
                      onPressed: () {}),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
