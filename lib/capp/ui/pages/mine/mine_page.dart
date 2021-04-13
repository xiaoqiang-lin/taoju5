import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/routes/capp_routes.dart';
import 'package:taoju5/capp/ui/pages/mine/mine_controller.dart';
import 'package:taoju5/capp/ui/pages/mine/section/mine_body_section.dart';
import 'package:taoju5/capp/ui/pages/mine/section/mine_footer_section.dart';
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
                onTap: () => Get.toNamed(CAppRoutes.mine + CAppRoutes.profile,
                    arguments: _.user),
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
