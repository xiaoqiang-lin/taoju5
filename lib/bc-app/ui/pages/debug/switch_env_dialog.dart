/*
 * @Description: 切换app环境对话框
 * @Author: iamsmiling
 * @Date: 2021-02-02 21:57:00
 * @LastEditTime: 2021-02-03 09:38:29
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

import 'debug_controller.dart';

Future<bool> showSwitchEnvDialog() {
  return showDialog<bool>(
      context: Get.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "切换app环境",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("切换环境后需要重新打开app,是否继续?"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("取消"),
                  ),
                  SizedBox(
                    width: BDimens.gap56,
                  ),
                  ElevatedButton(
                    onPressed: () => Get.find<DebugController>().save(context),
                    child: Text("确定"),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
