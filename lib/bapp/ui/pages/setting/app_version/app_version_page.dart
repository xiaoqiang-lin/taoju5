/*
 * @Description: App版本信息
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:55:50
 * @LastEditTime: 2021-01-09 20:58:26
 */
import 'package:flutter/material.dart';
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
          Image.asset("assets/images/logo.png"),
          Text(versionCode),
        ],
      )),
    );
  }
}
