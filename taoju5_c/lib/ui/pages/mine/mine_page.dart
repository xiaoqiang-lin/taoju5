/*
 * @Description: 我的页面
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-07-07 10:21:03
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';
import 'package:taoju5_c/ui/pages/mine/mine_skeleton.dart';
import 'package:taoju5_c/ui/pages/mine/section/mine_body_section.dart';
import 'package:taoju5_c/ui/pages/mine/section/mine_footer_section.dart';
import 'section/mine_header_section.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
        autoRemove: false,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: R.color.ffffffff,
              elevation: 0,
              leading: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(minHeight: 44),
                child: Text(
                  "我的",
                  style: TextStyle(
                      fontSize: R.dimen.sp18, fontWeight: FontWeight.w600),
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.mine + AppRoutes.setting,
                        arguments: _.user),
                    child: Image.asset(R.image.setting))
              ],
            ),
            body: FutureLoadStateBuilder<MineController>(
                controller: _,
                loadingBuilder: (BuildContext context) => MineSkeleton(),
                builder: (_) {
                  return Container(
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
                  );
                }),
          );
        });
  }
}
