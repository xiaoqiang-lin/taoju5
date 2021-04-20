/*
 * @Description: 修改手机号
 * @Author: iamsmiling
 * @Date: 2021-04-14 17:33:34
 * @LastEditTime: 2021-04-15 17:57:27
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/sms_text_field.dart';
import 'package:taoju5_c/component/textfield/telephone_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

import 'modify_telephone_controller.dart';
import 'package:get/get.dart';

class ModifyTelephoneFirstPage extends StatelessWidget {
  const ModifyTelephoneFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModifyTelephoneController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.only(top: R.dimen.dp50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: R.dimen.dp56,
                      right: R.dimen.dp56,
                      bottom: R.dimen.dp50),
                  child: Column(
                    children: [
                      Text("修改手机号", style: R.style.h1),
                      Container(
                        child: TelephoneTextField(),
                        margin: EdgeInsets.only(
                            top: R.dimen.dp48, bottom: R.dimen.dp20),
                      ),
                      SmsTextField(onPressed: () {}),
                    ],
                  ),
                ),
                PrimaryButton(
                    size: PrimaryButtonSize.large,
                    text: "下一步",
                    onPressed: () => Get.toNamed(AppRoutes.modifyTelephone2))
              ],
            ),
          ),
        ),
      );
    });
  }
}
