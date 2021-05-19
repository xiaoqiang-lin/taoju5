/*
 * @Description: 用户使用权限
 * @Author: iamsmiling
 * @Date: 2021-05-17 15:18:21
 * @LastEditTime: 2021-05-17 15:59:32
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';

Future<bool?> openUserAuthDialog(BuildContext context) {
  return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "温馨提示",
            textAlign: TextAlign.center,
          ),
          contentPadding: EdgeInsets.all(R.dimen.dp20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "欢迎来到淘居屋！",
                textAlign: TextAlign.start,
                style:
                    TextStyle(fontSize: R.dimen.sp12, color: R.color.ff666666),
              ),
              DefaultTextStyle(
                  style: TextStyle(
                    fontSize: R.dimen.sp12,
                    color: R.color.ff666666,
                  ),
                  child: Text.rich(
                    TextSpan(text: "为了更好的提供服务，我们依据相关法律制作了", children: [
                      WidgetSpan(
                          child: GestureDetector(
                        // onTap: () => Get.toNamed(BAppRoutes.userProtocol),
                        child: Text(
                          "《用户协议与隐私政策》",
                          style: TextStyle(color: R.color.ffee9b5f),
                        ),
                      )),
                      TextSpan(
                        text:
                            """帮助您了解、使用、存储和共享个人信息的情况，我们会根据您使用服务的具体功能需要，收集必要的用户信息（可能涉及账户、交易、设备等相关信息）。\n
未经您同意，我们不会从第三方获取、共享或对外提供您的信息。如您对指引内容有任何疑问、意向或者建议，欢迎随时联系我们。\n
[特别提示]当您点击「同意」即代表您已充分阅读、理解并接受淘居屋商家的""",
                      ),
                      WidgetSpan(
                          child: GestureDetector(
                        // onTap: () => Get.toNamed(BAppRoutes.userProtocol),
                        child: Text(
                          "《用户协议与隐私政策》",
                          style: TextStyle(
                              color: R.color.ffee9b5f,
                              fontSize: R.dimen.sp12,
                              height: .1),
                        ),
                      )),
                      TextSpan(text: "的全部内容。")
                    ]),
                  )),
              Container(
                margin: EdgeInsets.only(top: R.dimen.dp25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "不同意并退出",
                      onPressed: () {},
                      mode: PrimaryButtonMode.materialButton,
                      size: PrimaryButtonSize.middle,
                      margin: EdgeInsets.only(right: R.dimen.dp10),
                    ),
                    PrimaryButton(
                      text: "同意",
                      onPressed: () {},
                      size: PrimaryButtonSize.middle,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}
