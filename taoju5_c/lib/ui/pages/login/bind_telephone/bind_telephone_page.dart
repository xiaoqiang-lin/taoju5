/*
 * @Description: 绑定手机号
 * @Author: iamsmiling
 * @Date: 2021-06-07 17:03:27
 * @LastEditTime: 2021-06-07 17:22:38
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/textfield/sms_text_field.dart';
import 'package:taoju5_c/component/textfield/telephone_text_field.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/bind_telephone/bind_telephone_controller.dart';

class BindTelephonePage extends GetView<BindTelephoneController> {
  const BindTelephonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Text("绑定手机号",
                        style: TextStyle(
                            fontSize: R.dimen.sp18,
                            fontFamily: "PingFang",
                            fontWeight: FontWeight.w600)),
                    Container(
                      child: TelephoneTextField(
                        initialValue: controller.user.telephone,
                        onChanged: controller.setTelephone,
                      ),
                      margin: EdgeInsets.only(
                          top: R.dimen.dp48, bottom: R.dimen.dp20),
                    ),
                    SmsTextField(
                      onPressed: controller.getCaptcha,
                      onChanged: controller.setCaptcha,
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                  margin: EdgeInsets.symmetric(horizontal: R.dimen.dp56),
                  size: PrimaryButtonSize.large,
                  text: "确定",
                  textStyle: TextStyle(fontSize: R.dimen.sp17),
                  onPressed: controller.submit)
            ],
          ),
        ),
      ),
    );
  }
}
