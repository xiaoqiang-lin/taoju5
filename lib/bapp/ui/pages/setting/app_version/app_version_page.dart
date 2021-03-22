/*
 * @Description: App版本信息
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:55:50
 * @LastEditTime: 2021-01-09 20:58:26
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/config/app_manager.dart';
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
      body: Center(
          child: Column(
        children: [
          Container(
              margin:
                  EdgeInsets.only(top: BDimens.gap144, bottom: BDimens.gap32),
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
          Text(versionCode),
        ],
      )),
    );
  }
}
