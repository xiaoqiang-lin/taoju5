/*
 * @Description: 选品提示弹窗
 * @Author: iamsmiling
 * @Date: 2021-07-01 15:30:56
 * @LastEditTime: 2021-07-01 16:22:40
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/utils/url_launcher_kit.dart';

Future openProductSelectTipDialog(
    BuildContext context, ProductSelectTipEntity tip) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "温馨提示",
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.only(
              left: R.dimen.dp20,
              right: R.dimen.dp20,
              top: R.dimen.dp12,
              bottom: R.dimen.dp25),
          titleTextStyle: TextStyle(
              fontSize: R.dimen.sp15,
              color: R.color.ff1b1b1b,
              fontWeight: FontWeight.w600),
          content: Text.rich(TextSpan(
              text: tip.message,
              style: TextStyle(
                fontSize: R.dimen.sp14,
                color: R.color.ff666666,
              ),
              children: [
                TextSpan(
                  text: "您的订单可选商品只有卷帘，如有疑问您可以",
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        UrlLauncherKit.dial(tip.phone);
                      },
                    text: "联系客服",
                    style: TextStyle(
                      fontSize: R.dimen.sp14,
                      color: R.color.ffff5005,
                    )),
                TextSpan(
                  text: "了解详情。",
                ),
              ])),
          actions: [
            PrimaryButton(
              text: "我知道了",
              margin: EdgeInsets.only(
                  left: R.dimen.dp25,
                  right: R.dimen.dp25,
                  bottom: R.dimen.dp20),
              size: PrimaryButtonSize.large,
              onPressed: Navigator.of(context).pop,
            )
          ],
        );
      });
}
