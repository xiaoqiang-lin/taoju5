/*
 * @Description: c端首页
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:12:27
 * @LastEditTime: 2021-04-15 11:19:23
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/home/section/home_custom_made_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_scene_section.dart';

import 'home_controller.dart';
import 'section/home_banner_section.dart';

class CHomePage extends StatelessWidget {
  const CHomePage({Key key}) : super(key: key);

  static MethodChannel methodChannel = MethodChannel('taoju5_amap');

  // _goToMapView() async {
  //   return methodChannel.invokeMethod("goToMapView");
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CHomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: R.color.primaryColor,
          title: Text("首页"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CHomeBannerSection()),
            SliverToBoxAdapter(child: CHomeSceneSection()),
            SliverToBoxAdapter(child: CHomeCustomMadeSection())
          ],
        ),
      );
    });
  }
}