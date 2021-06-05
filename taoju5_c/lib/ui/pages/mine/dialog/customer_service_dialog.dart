/*
 * @Description: 客服对话框
 * @Author: iamsmiling
 * @Date: 2021-04-22 19:04:36
 * @LastEditTime: 2021-05-28 17:55:56
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future openCustomerServiceDialog(BuildContext context,
    {String telephone = "400-6666-8888"}) {
  dial(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastKit.error("无法打开链接");
      throw "Could not launch $url";
    }
  }

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
                  "客服电话",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: R.dimen.sp15,
                      color: R.color.ff1b1b1b,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp12),
                  child: Text(
                    "$telephone",
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
                        text: "拨打电话",
                        onPressed: () => dial("tel:$telephone"),
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
