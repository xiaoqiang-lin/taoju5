/*
 * @Description: 首页顶部
 * @Author: iamsmiling
 * @Date: 2021-01-12 09:50:13
 * @LastEditTime: 2021-02-02 14:15:03
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5/utils/common_kit.dart';

class HomePageHeader extends GetView<UserProviderController> {
  const HomePageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: BDimens.gap32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${controller.greetWord},${controller.user?.nickName}",
            style: TextStyle(
              fontSize: BDimens.sp36,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("${controller.user?.shopName}",
              style: TextStyle(
                  fontSize: BDimens.sp24, color: BColors.subTitleColor)),
          Container(
            width: Get.width,
            margin: EdgeInsets.only(top: BDimens.gap24),
            child: GestureDetector(
              onTap: () => Get.toNamed(BAppRoutes.productList),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: CachedNetworkImage(
                    imageUrl: CommonKit.asWebUrl("upload/master.jpg")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
