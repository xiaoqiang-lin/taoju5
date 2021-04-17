import 'package:flutter/material.dart';
import 'package:taoju5_c/component/appbar/app_bar.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_controller.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/widget/setting_tile.dart';

class CSettingPage extends StatelessWidget {
  const CSettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CSettingController>(builder: (_) {
      return Scaffold(
        appBar: CAppBar(
          title: Text("设置"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      for (CSettingTileEntity item in _.accountGroup)
                        CSettingListTile(entity: item)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp30),
                  child: Column(
                    children: [
                      for (CSettingTileEntity item in _.appGroup)
                        CSettingListTile(entity: item)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
