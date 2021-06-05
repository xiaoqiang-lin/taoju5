/*
 * @Description: 取消订单弹窗
 * @Author: iamsmiling
 * @Date: 2021-05-25 09:37:25
 * @LastEditTime: 2021-06-04 10:51:09
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future openCancelOrderDialog(BuildContext context) {
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
                  "确定取消订单吗？",
                  style: TextStyle(
                      fontSize: R.dimen.sp15,
                      color: R.color.ff1b1b1b,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp12, bottom: R.dimen.dp25),
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                  child: Text(
                    "您的订单已上门测量成功，现在取消订单平台将不退还测量费用",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff666666),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "继续取消",
                      onPressed: () {},
                      size: PrimaryButtonSize.middle,
                      mode: PrimaryButtonMode.materialButton,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "暂不取消",
                      onPressed: () {},
                      size: PrimaryButtonSize.middle,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
