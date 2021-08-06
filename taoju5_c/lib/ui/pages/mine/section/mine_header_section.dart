/*
 * @Description: 我的 头部
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-08-05 13:45:45
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class MineHeaderSection extends StatelessWidget {
  final UserEntity user;
  const MineHeaderSection({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          Get.toNamed(AppRoutes.mine + AppRoutes.profile, arguments: user),
      child: Container(
        margin: EdgeInsets.only(top: R.dimen.dp20),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: R.dimen.dp16),
              child: CircleAvatar(
                key: ValueKey(user.avatar),
                radius: 30,
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                      fontSize: R.dimen.sp15, fontWeight: FontWeight.w500),
                ),
                Container(
                    margin: EdgeInsets.only(top: R.dimen.dp8),
                    child: Text(
                      "账号:${user.account}(默认注册手机号)",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ffb5b5b5),
                    ))
              ],
            )),
            Image.asset(R.image.next)
          ],
        ),
      ),
    );
  }
}
