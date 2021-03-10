/*
 * @Description: 授权
 * @Author: iamsmiling
 * @Date: 2021-01-10 15:19:44
 * @LastEditTime: 2021-01-10 16:33:32
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';

Future showAuthDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "温馨提示",
            textAlign: TextAlign.center,
          ),
          contentPadding:
              EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: BDimens.gap8),
                child: Text(
                  "欢迎来到淘居屋商家！",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: BDimens.sp28),
                ),
              ),
              DefaultTextStyle(
                  style: TextStyle(
                      fontSize: BDimens.sp24,
                      color: BColors.descriptionTextColor),
                  child: Text.rich(
                      TextSpan(text: "为了更好的提供服务，我们依据相关法律制作了", children: [
                    WidgetSpan(
                        child: GestureDetector(
                      onTap: () => Get.toNamed(BAppRoutes.userProtocol),
                      child: Text(
                        "《用户协议与隐私政策》",
                        style: TextStyle(color: BColors.linkTextColor),
                      ),
                    )),
                    TextSpan(
                        text:
                            """帮助您了解、使用、存储和共享个人信息的情况，我们会根据您使用服务的具体功能需要，收集必要的用户信息（可能涉及账户、交易、设备等相关信息）。\n
未经您同意，我们不会从第三方获取、共享或对外提供您的信息。如您对指引内容有任何疑问、意向或者建议，欢迎随时联系我们。\n
[特别提示]当您点击「同意」即代表您已充分阅读、理解并接受淘居屋商家的《用户协议与隐私政策》的全部内容。
  """,
                        style: TextStyle(height: 1))
                  ]))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("不同意"),
                  ),
                  SizedBox(
                    width: BDimens.gap56,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("  同意  "),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
