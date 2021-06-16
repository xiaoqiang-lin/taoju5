/*
 * @Description: 清除缓存
 * @Author: iamsmiling
 * @Date: 2021-06-08 09:24:54
 * @LastEditTime: 2021-06-08 10:54:44
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future openCleanCacheDialog(BuildContext context, {Function? onCleanCache}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: R.dimen.dp24, bottom: R.dimen.dp20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "清除缓存",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: R.dimen.sp15,
                      color: R.color.ff1b1b1b,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp12),
                  child: Text(
                    "您确定要清除缓存吗",
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
                        text: "取消",
                        onPressed: Navigator.of(context).pop,
                        mode: PrimaryButtonMode.materialButton,
                        size: PrimaryButtonSize.middle,
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                      ),
                      PrimaryButton(
                        text: "立即清除",
                        onPressed: () {
                          if (onCleanCache != null) {
                            onCleanCache();
                          }
                          Navigator.of(context).pop();
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
