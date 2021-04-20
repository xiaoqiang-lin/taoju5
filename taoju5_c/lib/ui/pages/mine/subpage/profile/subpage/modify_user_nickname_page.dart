/*
 * @Description:修改用户昵称
 * @Author: iamsmiling
 * @Date: 2021-04-19 14:56:56
 * @LastEditTime: 2021-04-19 15:25:43
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/appbar/primary_app_bar.dart';
import 'package:taoju5_c/component/textfield/clearable_text_field.dart';
import 'package:taoju5_c/domain/entity/params/user/modify_user_profile_params.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_controller.dart';
import 'package:get/get.dart';

class ModifyUserNicknamePage extends StatelessWidget {
  const ModifyUserNicknamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Scaffold(
        appBar: PrimaryAppBar(
          title: "修改昵称",
          actions: [
            TextButton(
                onPressed: () => _
                    .modify(field: ModifyUserProfileField.nickname)
                    .whenComplete(Get.back),
                child: Text("确定"))
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClearableTextField(
                  initialValue: _.user.name,
                  onChanged: _.setNickname,
                  decoration: InputDecoration(hintText: "请输入用户昵称"),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
