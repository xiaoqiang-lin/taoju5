/*
 * @Description: 退出提醒
 * @Author: iamsmiling
 * @Date: 2021-01-10 15:46:42
 * @LastEditTime: 2021-01-10 16:35:46
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "退出提醒",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("你确定要退出吗?"),
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
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("确定"),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
