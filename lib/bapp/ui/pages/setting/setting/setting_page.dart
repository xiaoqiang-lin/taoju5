/*
 * @Description: 设置页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:53:48
 * @LastEditTime: 2021-01-12 10:39:31
 */
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/setting/setting/setting_controller.dart';

import 'fragment/setting_header.dart';
import 'widget/x_label_tile.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: GetBuilder<SettingController>(builder: (_) {
        return Column(
          children: [
            SettingHeader(),
            XLabelTile(
              label: "清除缓存",
              trailing: Text(_.cacheSize),
              onTap: _.clearCache,
            ),
            Divider(),
            XLabelTile(
              label: "重置密码",
              onTap: () => Get.toNamed(BAppRoutes.resetPassword),
            ),
            Divider(
              height: BDimens.gap16,
            ),
            XLabelTile(
              label: "问题反馈",
              onTap: () => Get.toNamed(BAppRoutes.feedback),
            ),
            Divider(),
            XLabelTile(
              label: "用户协议",
              onTap: () => Get.toNamed(BAppRoutes.userProtocol),
            ),
            Divider(),
            XLabelTile(
              label: "关于淘居屋",
              trailing: Text(_.versionCode),
              onTap: () => Get.toNamed(BAppRoutes.appVersion),
            ),
            Divider(),
            XLabelTile(
              label: "售后服务",
              onTap: () => Get.toNamed(BAppRoutes.afterSell),
            ),
            Divider(),
            XLabelTile(
              label: "我的客服",
              trailing: Text("18968072319"),
            ),
            Container(
                margin: EdgeInsets.only(top: BDimens.gap16),
                color: BColors.primaryColor,
                width: Get.width,
                child: TextButton(onPressed: _.logOut, child: Text("退出")))
          ],
        );
      }),
    );
  }
}
