/*
 * @Description: 清除缓存的弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-10 15:37:57
 * @LastEditTime: 2021-01-10 16:36:45
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

Future showClearCacheDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "清除缓存",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("你确定要清除缓存吗"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
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
