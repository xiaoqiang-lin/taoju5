/*
 * @Description: 首页顶部
 * @Author: iamsmiling
 * @Date: 2021-01-12 09:50:13
 * @LastEditTime: 2021-02-02 14:15:03
 */
import 'package:taoju5_b/ui/widgets/common/x_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5_bc/utils/common_kit.dart';

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
          Container(
            margin: EdgeInsets.only(bottom: BDimens.gap16),
            child: Text("${controller.user?.shopName}",
                style: TextStyle(
                    fontSize: BDimens.sp24, color: BColors.subTitleColor)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Container(
              width: Get.width,
              child: AspectRatio(
                aspectRatio: 1.36,
                child: GestureDetector(
                  onTap: () => Get.toNamed(BAppRoutes.productList),
                  child: XCachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: CommonKit.asWebUrl("upload/master.jpg")),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
