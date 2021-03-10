/*
 * @Description: 设置页面的头部
 * @Author: iamsmiling
 * @Date: 2021-01-07 21:41:14
 * @LastEditTime: 2021-01-12 19:40:04
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/setting/setting/setting_controller.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return Container(
        color: Get.theme.primaryColor,
        padding: EdgeInsets.symmetric(
            horizontal: BDimens.gap16, vertical: BDimens.gap20),
        margin: EdgeInsets.only(bottom: BDimens.gap16),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: BDimens.gap32),
              child: CircleAvatar(
                radius: 64.sp,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _.user?.nickName ?? "",
                      style: TextStyle(
                          fontSize: BDimens.sp36, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: BDimens.gap40),
                      child: Text(
                        _.user?.userTel ?? "",
                        style: TextStyle(
                            fontSize: BDimens.sp30,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: BDimens.gap10),
                    child: Text(
                      _.user?.shopName ?? "",
                      style: TextStyle(
                          color: BColors.subtitle1, fontSize: BDimens.sp28),
                    ))
              ],
            ))
          ],
        ),
      );
    });
  }
}
