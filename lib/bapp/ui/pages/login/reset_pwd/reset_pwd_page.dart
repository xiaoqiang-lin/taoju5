import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';

import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/login/reset_pwd/reset_pwd_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

class ResetPwdPage extends GetView<ResetPwdController> {
  const ResetPwdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("重置密码"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: BDimens.gap144, bottom: BDimens.gap36),
                child: Text(
                  "重置密码",
                  style: TextStyle(
                      fontSize: BDimens.sp36, fontWeight: FontWeight.w500),
                ),
              ),
              GetBuilder<ResetPwdController>(
                id: "oldPassword",
                key: ValueKey("oldPassword"),
                builder: (_) {
                  return TextField(
                    decoration: InputDecoration(
                        hintText: "请输入旧密码",
                        suffixIcon: IconButton(
                          onPressed: _.switchOldPasswordMode,
                          icon: Icon(
                            _.isOldPasswordCypher
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: BColors.iconColor,
                          ),
                        )),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap36),
                child: GetBuilder<ResetPwdController>(
                  id: "newPassword",
                  key: ValueKey("newPassword"),
                  builder: (_) {
                    return TextField(
                      onChanged: _.setNewPassword,
                      decoration: InputDecoration(
                          hintText: "请输入新密码",
                          suffixIcon: Icon(
                            _.isNewPasswordCypher
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: BColors.iconColor,
                          )),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap48),
                width: Get.width,
                child: XFutureButton(
                    child: Text("完成"), onFuture: controller.submit),
              )
            ],
          ),
        ),
      ),
    );
  }
}
