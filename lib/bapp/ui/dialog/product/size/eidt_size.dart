/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-28 13:45:32
 * @LastEditTime: 2021-04-28 15:07:43
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';

Future showEditSizeDialog(
    {@required String tag, String initialWidth, String initialHeight}) {
  return showDialog(
      context: Get.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GetBuilder<SizeSelectorController>(
            tag: tag,
            builder: (_) {
              return AlertDialog(
                title: Text("请输入卷帘尺寸", textAlign: TextAlign.center),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: BDimens.gap32, vertical: BDimens.gap16),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("不足1㎡按1㎡计算"),
                    Row(
                      children: [
                        Text("宽:"),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: TextFormField(
                              // initialValue: _.width,
                              autofocus: true,
                              onChanged: _.setValue,
                              controller: _.widthController,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: '请填写宽度',
                                  fillColor: const Color(0xFFF2F2F2),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                          ),
                        ),
                        Text("cm"),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: BDimens.gap16),
                      child: Row(
                        children: [
                          Text("高:"),
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: TextFormField(
                                // initialValue: _.height,
                                autofocus: true,
                                onChanged: _.setValue,
                                controller: _.heightController,
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: '请填写高度',
                                    fillColor: const Color(0xFFF2F2F2),
                                    contentPadding: EdgeInsets.all(10)),
                              ),
                            ),
                          ),
                          Text("cm"),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("取消"),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        ElevatedButton(onPressed: _.setWH, child: Text("确定"))
                      ],
                    )
                  ],
                ),
              );
            });
      });
}
