/*
 * @Description: 我的页面
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-18 12:48:37
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/appbar/primary_app_bar.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';
import 'package:taoju5_c/ui/pages/mine/section/mine_body_section.dart';
import 'package:taoju5_c/ui/pages/mine/section/mine_footer_section.dart';
import 'section/mine_header_section.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(builder: (_) {
      return Scaffold(
        appBar: PrimaryAppBar(
          backgroundColor: R.color.appBarColor,
          elevation: 0,
          title: "我的",
          actions: [
            GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.setting),
                child: Image.asset(R.image.setting))
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MineHeaderSection(user: _.user),
                MineBodySection(kongos: _.kongos),
                MineFooterSection(tiles: _.tiles)
              ],
            ),
          ),
        ),
      );
    });
  }
}