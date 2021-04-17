/*
 * @Description: App版本信息
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:55:50
 * @LastEditTime: 2021-04-17 17:39:11
 */
import 'package:flutter/material.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/home/app_controller.dart';
import 'package:taoju5_b/ui/pages/setting/setting/widget/x_label_tile.dart';
import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_bc/config/app_manager.dart';
import 'package:get/get.dart';

class AppVersionPage extends StatefulWidget {
  const AppVersionPage({Key key}) : super(key: key);

  @override
  _AppVersionPageState createState() => _AppVersionPageState();
}

class _AppVersionPageState extends State<AppVersionPage> {
  String versionCode = "";

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    versionCode = await AppManager.getAppVersion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("版本信息"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: BDimens.gap144, bottom: BDimens.gap16),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            color: Color.fromARGB(45, 0, 0, 0)),
                      ]),
                  child: Image.asset("assets/images/logo.png")),
              Container(
                padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
                child: Text(
                  AppConfig.appName,
                  style: TextStyle(
                      fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Version:$versionCode",
                style: TextStyle(fontSize: BDimens.sp28),
              ),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap32),
                child: GetBuilder<AppController>(
                    init: AppController(),
                    builder: (_) {
                      return XLabelTile(
                          label: "检查更新",
                          trailing: Row(
                            children: [
                              Visibility(
                                  visible: !_.hasNewVersion,
                                  child: Text("当前已是最新版本")),
                              Visibility(
                                visible: _.hasNewVersion,
                                child: Container(
                                  margin: EdgeInsets.only(left: BDimens.gap16),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor: BColors.badgeColor,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Visibility(
                                          visible: _.hasNewVersion,
                                          child: Text(
                                            "最新版本:${_.lasestVersion}",
                                            style: TextStyle(
                                                color: BColors.greyTextColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: _.upgradeApp);
                    }),
              ),
              Divider(),
            ],
          )),
    );
  }
}
