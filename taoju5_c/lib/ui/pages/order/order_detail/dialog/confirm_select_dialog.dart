/*
 * @Description: 确认选品弹窗
 * @Author: iamsmiling
 * @Date: 2021-07-09 10:05:01
 * @LastEditTime: 2021-07-09 10:09:26
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future<bool?> openConfirmSelectDialog(BuildContext context, String message) {
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
                  "选品确定提示",
                  style: TextStyle(
                      fontSize: R.dimen.sp15,
                      color: R.color.ff1b1b1b,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp12, bottom: R.dimen.dp25),
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                  child: Text.rich(
                    TextSpan(
                        text: "您的订单还有",
                        style: TextStyle(
                            fontSize: R.dimen.sp14, color: R.color.ff666666),
                        children: [
                          TextSpan(
                              text: message,
                              style: TextStyle(color: R.color.ffee9b5f)),
                          TextSpan(
                            text: "待选品, 是否确定选品已完成?",
                          ),
                        ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "确定",
                      onPressed: () => Navigator.of(context).pop(true),
                      size: PrimaryButtonSize.middle,
                      mode: PrimaryButtonMode.materialButton,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "继续选品",
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
