/*
 * @Description: 修改头像
 * @Author: iamsmiling
 * @Date: 2021-04-22 13:15:54
 * @LastEditTime: 2021-04-22 14:19:23
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/subpage/modify_user_avatar/modify_user_avatar_controller.dart';

class ModifyUserAvatarPage extends StatelessWidget {
  const ModifyUserAvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModifyUserAvatarController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: R.color.ff00000,
          appBar: AppBar(
            backgroundColor: R.color.ff00000,
            titleSpacing: 0,
            iconTheme: IconThemeData(color: R.color.ffffffff),
            title: Text(
              "头像",
              style: TextStyle(color: R.color.ffffffff),
            ),
            actions: [
              IconButton(
                  icon: Image.asset(R.image.more), onPressed: _.pickImage)
            ],
          ),
          body: Center(child: _.avatar),
        );
      },
    );
  }
}
