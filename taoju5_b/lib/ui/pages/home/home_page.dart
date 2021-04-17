/*
 * @Description: 首页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:19:50
 * @LastEditTime: 2021-04-17 17:31:42
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/home/fragment/home_page_body.dart';
import 'package:taoju5_b/ui/pages/home/fragment/home_page_header.dart';
import 'package:taoju5_b/ui/pages/home/home_controller.dart';
import 'package:taoju5_bc/config/app_config.dart';

class HomePage extends GetView<HomeController> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Visibility(
          visible: AppConfig.isDebug,
          child: FloatingActionButton(
            onPressed: () => Get.toNamed(BAppRoutes.debug),
            child: Text("调试"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [HomePageHeader(), HomePageBody()],
          ),
        ),
      ),
    );
  }
}
