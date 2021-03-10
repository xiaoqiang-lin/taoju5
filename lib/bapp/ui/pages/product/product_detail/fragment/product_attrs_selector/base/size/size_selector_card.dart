/*
 * @Description: 填写尺寸信息等
 * @Author: iamsmiling
 * @Date: 2021-01-19 15:06:40
 * @LastEditTime: 2021-02-01 15:49:46
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_sized_text_field.dart';

class SizeSelectorCard extends StatelessWidget {
  final String tag;
  const SizeSelectorCard({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SizeSelectorController>(
        tag: tag,
        builder: (_) {
          return Container(
            margin: EdgeInsets.only(top: BDimens.gap20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text("宽(cm)"),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: XSizedTextField(
                        initialValue: _.width,
                        controller: _.widthController,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: BDimens.gap20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text("高(cm)"),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 2,
                        child: XSizedTextField(
                          initialValue: _.height,
                          controller: _.heightController,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text("离地距离"),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: XSizedTextField(
                        initialValue: _.deltaY,
                        controller: _.deltaYController,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
