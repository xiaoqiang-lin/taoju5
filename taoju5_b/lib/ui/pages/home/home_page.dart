/*
 * @Description: 首页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:19:50
 * @LastEditTime: 2021-07-30 06:42:03
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:taoju5_b/routes/bapp_routes.dart';
import 'package:taoju5_b/ui/pages/home/fragment/home_page_body.dart';
import 'package:taoju5_b/ui/pages/home/fragment/home_page_header.dart';
import 'package:taoju5_b/ui/pages/home/home_controller.dart';
// import 'package:taoju5_bc/config/app_config.dart';

class HomePage extends GetView<BHomeController> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: Visibility(
        //   visible: AppConfig.isDebug,
        //   child: FloatingActionButton(
        //     onPressed: () => Get.toNamed(BAppRoutes.debug),
        //     child: Text("调试"),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [HomePageHeader(), HomePageBody()],
          ),
        ),
      ),
    );
  }
}
