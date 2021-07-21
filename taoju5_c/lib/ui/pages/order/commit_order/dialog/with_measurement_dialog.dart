/*
 * @Description: 需要测量
 * @Author: iamsmiling
 * @Date: 2021-07-20 17:09:52
 * @LastEditTime: 2021-07-20 17:34:01
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future openWithMeasurementDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(
              left: R.dimen.dp20,
              right: R.dimen.dp20,
              top: R.dimen.dp12,
              bottom: R.dimen.dp25),
          title: Text(
            "需要上门测装",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: R.dimen.sp15,
                fontWeight: FontWeight.w600,
                color: R.color.ff1b1b1b),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "测量完成后请及时确认测装数据，平台 会以您确认的尺寸定制生产。",
                style:
                    TextStyle(fontSize: R.dimen.sp14, color: R.color.ff666666),
              ),
              Container(
                margin: EdgeInsets.only(top: R.dimen.dp24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "不需要",
                      onPressed: () => Navigator.of(context).pop(false),
                      size: PrimaryButtonSize.middle,
                      mode: PrimaryButtonMode.materialButton,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "确认提交",
                      onPressed: () => Navigator.of(context).pop(true),
                      size: PrimaryButtonSize.middle,
                      textStyle: TextStyle(fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}
