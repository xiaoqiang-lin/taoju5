/*
 * @Description: app更新弹窗
 * @Author: iamsmiling
 * @Date: 2021-06-08 10:17:54
 * @LastEditTime: 2021-06-08 10:39:54
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_manager.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future<bool?> openAppUpdateDialog(BuildContext context,
    {required AppInfoModel app}) {
  return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(
                top: R.dimen.dp24,
                bottom: R.dimen.dp20,
                left: R.dimen.dp24,
                right: R.dimen.dp24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: R.dimen.width,
                  child: Text(
                    "发现新版本",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: R.dimen.sp15,
                        color: R.color.ff1b1b1b,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp12),
                  child: Text(
                    "${app.log}",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff666666),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        text: "以后再说",
                        onPressed: Navigator.of(context).pop,
                        mode: PrimaryButtonMode.materialButton,
                        size: PrimaryButtonSize.middle,
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                      ),
                      PrimaryButton(
                        text: "立即更新",
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        size: PrimaryButtonSize.middle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
