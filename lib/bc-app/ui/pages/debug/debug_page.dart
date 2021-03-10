/*
 * @Description: app不同环境调试页面
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:36:15
 * @LastEditTime: 2021-02-03 09:21:02
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';

import 'package:get/get.dart';
import 'package:taoju5/config/app_config.dart';

import 'debug_controller.dart';
import 'switch_env_dialog.dart';

class DebugEnvPage extends StatelessWidget {
  const DebugEnvPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DebugController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppConfig.appName),
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("服务对象"),
                    Row(
                      children: [
                        Text("C端"),
                        CupertinoSwitch(
                            value: _.isBEndApp, onChanged: _.switchEnv),
                        Text("B端"),
                      ],
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("测试环境"),
                    Row(
                      children: [
                        Text("正式"),
                        CupertinoSwitch(
                            value: _.isDebug, onChanged: _.switchMode),
                        Text("测试"),
                      ],
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("当前版本"),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("${AppConfig.appName}"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("目标版本"),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("${_.appName}"))
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("当前服务器地址"),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("${AppConfig.baseUrl}"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("目标服务器地址"),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("${_.baseUrl}"))
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: BColors.primaryColor,
            height: kBottomNavigationBarHeight,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
                onPressed: showSwitchEnvDialog, child: Text("保存并修改")),
          ),
        );
      },
    );
  }
}
