/*
 * @Description: 重置密码
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:43:15
 * @LastEditTime: 2020-12-28 16:59:05
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/login/forget_pwd/forget_password_controller.dart';
import 'package:taoju5/bapp/ui/pages/login/login/widget/x_sms_input_field.dart';
import 'package:taoju5/bapp/ui/pages/login/login/widget/x_tel_input_field.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

class ForgetPasswrdPage extends StatelessWidget {
  const ForgetPasswrdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("找回密码"),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ForgetPasswordController>(builder: (_) {
          return Container(
            height: Get.height,
            color: Get.theme.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: BDimens.gap144, bottom: BDimens.gap36),
                  child: Text(
                    "找回密码",
                    style: TextStyle(
                        fontSize: BDimens.sp36, fontWeight: FontWeight.w500),
                  ),
                ),
                // GetBuilder<ResetPwdController>(
                //   id: "oldPassword",
                //   key: ValueKey("oldPassword"),
                //   builder: (_) {
                //     return TextField(
                //       decoration: InputDecoration(
                //           hintText: "请输入旧密码",
                //           suffixIcon: IconButton(
                //             onPressed: _.switchOldPasswordMode,
                //             icon: Icon(
                //               _.isOldPasswordCypher
                //                   ? Icons.visibility_off
                //                   : Icons.visibility,
                //               color: BColors.iconColor,
                //             ),
                //           )),
                //     );
                //   },
                // ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap16),
                    child: XTelInputField(
                      onChanged: _.setTel,
                    )),

                Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap16),
                    child: XSmsTextField(
                      fetchSMS: _.getSms,
                      onChanged: _.setCode,
                    )),
                // Container(
                //   margin: EdgeInsets.only(top: BDimens.gap36),
                //   child: GetBuilder<ResetPwdController>(
                //     id: "newPassword",
                //     key: ValueKey("newPassword"),
                //     builder: (_) {
                //       return TextField(
                //         onChanged: _.setNewPassword,
                //         decoration: InputDecoration(
                //             hintText: "请输入新密码",
                //             suffixIcon: Icon(
                //               _.isNewPasswordCypher
                //                   ? Icons.visibility_off
                //                   : Icons.visibility,
                //               color: BColors.iconColor,
                //             )),
                //       );
                //     },
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: BDimens.gap48),
                  width: Get.width,
                  child: XFutureButton(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: BDimens.gap24),
                          child: Text("下一步")),
                      onFuture: _.checkSms),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
