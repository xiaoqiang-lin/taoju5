/*
 * @Description: 我的页面
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-15 11:24:19
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/capp_routes.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';
import 'package:taoju5_c/ui/pages/mine/section/mine_body_section.dart';
import 'package:taoju5_c/ui/pages/mine/section/mine_footer_section.dart';
import 'section/mine_header_section.dart';

class CMinePage extends StatelessWidget {
  const CMinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CMineController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: R.color.appBarColor,
          elevation: 0,
          title: Text("我的"),
          actions: [
            GestureDetector(
                onTap: () => Get.toNamed(CAppRoutes.mine + CAppRoutes.setting),
                child: Image.asset(R.image.setting))
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CMineHeaderSection(user: _.user),
                CMineBodySection(kongos: _.kongos),
                CMineFooterSection(tiles: _.tiles)
              ],
            ),
          ),
        ),
      );
    });
  }
}
