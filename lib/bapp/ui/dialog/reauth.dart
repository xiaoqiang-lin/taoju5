/*
 * @Description: 二次授权
 * @Author: iamsmiling
 * @Date: 2021-01-10 15:30:00
 * @LastEditTime: 2021-01-10 15:32:24
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

Future showReauthDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "温馨提示",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "您需要同意后，才能继续使用淘居屋商家的服务",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => SystemChannels.platform
                        .invokeMethod('SystemNavigator.pop'),
                    child: Text("不同意并退出"),
                  ),
                  SizedBox(
                    width: BDimens.gap56,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("同意并使用"),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
