/*
 * @Description: c端首页
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:12:27
 * @LastEditTime: 2021-04-20 17:17:24
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/home/section/home_custom_made_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_decoration_prefecture_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_physicial_store_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_scene_section.dart';

import 'home_controller.dart';
import 'section/home_banner_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static MethodChannel methodChannel = MethodChannel('taoju5_amap');

  // _goToMapView() async {
  //   return methodChannel.invokeMethod("goToMapView");
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: R.color.primaryColor,
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: Image.asset(R.image.location),
            onPressed: () {},
          ),
          title: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(R.image.search),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp3),
                  child: Text(
                    "搜索您想找的内容",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: R.dimen.sp10, color: R.color.whiteColor),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: R.color.whiteColor.withOpacity(.3)),
          ),
          actions: [
            IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(R.image.message),
                onPressed: () {})
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HomeBannerSection()),
            SliverToBoxAdapter(child: HomeSceneSection()),
            SliverToBoxAdapter(child: HomeCustomMadeSection()),
            SliverToBoxAdapter(child: HomeDecorationPrefectureSection()),
            SliverToBoxAdapter(child: HomePhysicialStoreSection()),
          ],
        ),
      );
    });
  }
}
