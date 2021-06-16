import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_controller.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("个人资料"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///头像
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Get.toNamed(
                      AppRoutes.mine +
                          AppRoutes.profile +
                          AppRoutes.modifyUserAvatar,
                      parameters: {"avatar": _.user.avatar}),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                    child: Row(
                      children: [
                        Text(
                          "头像",
                          style: TextStyle(fontSize: R.dimen.sp14),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(_.user.avatar),
                        ),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                ),
                Divider(),

                ///昵称
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Get.toNamed(
                      AppRoutes.mine +
                          AppRoutes.profile +
                          AppRoutes.modifyUserNickname,
                      arguments: _.user),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                    child: Row(
                      children: [
                        Text(
                          "昵称",
                          style: TextStyle(fontSize: R.dimen.sp14),
                        ),
                        Spacer(),
                        Text(
                          _.user.name,
                          style: TextStyle(fontSize: R.dimen.sp12),
                        ),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                ),
                Divider(),

                ///性别
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _.setGender,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                    child: Row(
                      children: [
                        Text(
                          "性别",
                          style: TextStyle(fontSize: R.dimen.sp14),
                        ),
                        Spacer(),
                        Text(
                          _.user.gender.name,
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ffb4b4b4),
                        ),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                ),
                Divider(),

                GestureDetector(
                  onTap: _.setBirthday,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                    child: Row(
                      children: [
                        Text(
                          "生日",
                          style: TextStyle(fontSize: R.dimen.sp14),
                        ),
                        Spacer(),
                        Text("1988/08/08",
                            style: TextStyle(fontSize: R.dimen.sp12)),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
