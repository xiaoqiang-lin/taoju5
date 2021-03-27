import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

Future showDesignProductMeasureDataConfirmDialog({
  @required int count,
  double defaultWidth = 3.5,
  double defaultHeight = 2.65,
}) {
  return showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "确认窗帘测装数据",
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "有$count扇窗帘使用平台默认尺寸宽$defaultWidth米、高$defaultHeight米,实际以平台测量为准,若有自测尺寸,请修改测装数据"),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () => Get.back(result: false),
                      child: Text("返回修改"),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    ElevatedButton(
                        onPressed: () => Get.back(result: true),
                        child: Text("   确定   "))
                  ],
                ),
              )
            ],
          ),
        );
      });
}
