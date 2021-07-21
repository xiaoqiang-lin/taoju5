/*
 * @Description: 不需要测量
 * @Author: iamsmiling
 * @Date: 2021-05-25 09:08:59
 * @LastEditTime: 2021-07-17 16:40:30
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future openOutOfServiceAreaDialog(BuildContext context,
    {required String message}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(
              left: R.dimen.dp20,
              right: R.dimen.dp20,
              top: R.dimen.dp12,
              bottom: R.dimen.dp25),
          title: Text(
            "地区超出范围提醒",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: R.dimen.sp15,
                fontWeight: FontWeight.w600,
                color: R.color.ff1b1b1b),
          ),
          content: Text(
            "$message",
            style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff666666),
          ),
          actions: [
            PrimaryButton(
              text: "我知道了",
              margin: EdgeInsets.only(
                  left: R.dimen.dp20,
                  bottom: R.dimen.dp10,
                  right: R.dimen.dp20),
              onPressed: Navigator.of(context).pop,
              size: PrimaryButtonSize.large,
              padding: EdgeInsets.symmetric(vertical: R.dimen.dp9),
            )
          ],
        );
      });
}
