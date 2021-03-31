import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

Future<bool> showAppPermissionRequestDialog(String description) {
  return showDialog<bool>(
      context: Get.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "权限申请",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(description),
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
                    child: Text("前往设置"),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
