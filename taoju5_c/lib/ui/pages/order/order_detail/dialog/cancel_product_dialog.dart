/*
 * @Description: 取消商品弹窗
 * @Author: iamsmiling
 * @Date: 2021-07-05 15:57:33
 * @LastEditTime: 2021-07-07 17:41:51
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future<bool?> openCancelProductDialog(BuildContext context, String message) {
  if (message.isEmpty) return Future.value(true);
  return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: R.dimen.dp24, bottom: R.dimen.dp20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "确定取消商品吗？",
                  style: TextStyle(
                      fontSize: R.dimen.sp15,
                      color: R.color.ff1b1b1b,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp12, bottom: R.dimen.dp25),
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff666666),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "继续取消",
                      onPressed: () => Navigator.of(context).pop(true),
                      size: PrimaryButtonSize.middle,
                      mode: PrimaryButtonMode.materialButton,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "暂不取消",
                      onPressed: () => Navigator.of(context).pop(false),
                      size: PrimaryButtonSize.middle,
                      textStyle: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
