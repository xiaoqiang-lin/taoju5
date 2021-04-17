import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/app/app_info_model.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/ui/pages/home/app_controller.dart';
import 'package:taoju5_bc/utils/common_kit.dart';

class AppUpgradeDialogBuilder extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onOk;
  final AppInfoModel appInfo;
  const AppUpgradeDialogBuilder({
    Key key,
    this.onCancel,
    this.onOk,
    @required this.appInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 56),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/app_upgrade.png"),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                width: Get.width,
                color: Get.theme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(color: BColors.greyTextColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("名称:${appInfo.title}"),
                            Text("版本号:${appInfo.version}"),
                            Text("更新时间:${appInfo.createAt}"),
                            Text("版本描述:"),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (String desc in appInfo?.log?.split("\n"))
                                    Text(desc?.trim() ?? "")
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LinearProgressIndicator(
                          backgroundColor: !CommonKit.isNullOrZero(_.progress)
                              ? Colors.yellow[300].withAlpha(100)
                              : Colors.transparent,
                          minHeight: 2,
                          value: _.progress,
                          valueColor:
                              AlwaysStoppedAnimation(Colors.yellow[300]),
                        ),
                      ),
                    ),
                    Container(
                      height: 36,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                              visible: !CommonKit.isNullOrZero(_.progress),
                              child: Center(
                                child: Text(
                                  "${(_.progress * 100).toStringAsFixed(2)}%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFFfecd7b)),
                                ),
                              )),
                          Visibility(
                            visible: CommonKit.isNullOrZero(_.progress),
                            child: Column(
                              children: [
                                Visibility(
                                    visible: appInfo.isForceUpdate,
                                    child: GestureDetector(
                                      onTap: _.downloadApk,
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFfecd7b),
                                              border: Border.all(
                                                  color: Color(0xFFfecd7b)),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            "立即体验",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    )),
                                Visibility(
                                  visible: !appInfo.isForceUpdate,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: Get.back,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFFfecd7b),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            "下次再说",
                                            style: TextStyle(
                                                color: BColors.accentColor),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 24),
                                      GestureDetector(
                                        onTap: _.downloadApk,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFfecd7b),
                                              border: Border.all(
                                                  color: Color(0xFFfecd7b)),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            "立即体验",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
