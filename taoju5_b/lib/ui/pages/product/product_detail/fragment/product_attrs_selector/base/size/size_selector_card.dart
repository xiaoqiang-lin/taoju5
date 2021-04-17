/*
 * @Description: 填写尺寸信息等
 * @Author: iamsmiling
 * @Date: 2021-01-19 15:06:40
 * @LastEditTime: 2021-02-01 15:49:46
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5_b/ui/widgets/common/textfield/x_sized_text_field.dart';

class SizeSelectorCard extends StatelessWidget {
  final String tag;
  const SizeSelectorCard({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SizeSelectorController>(
        tag: tag,
        autoRemove: false,
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
                      flex: 2,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // border:
                          //     Border.all(color: BColors.inputBorderColor)
                        ),
                        child: XSizedTextField(
                          height: 36,
                          initialValue: _.width,
                          controller: _.widthController,
                          hintText: "请输入宽度(cm)",
                        ),
                      ),
                    ),
                    Spacer(flex: 2)
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
                        flex: 2,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            // border:
                            //     Border.all(color: BColors.inputBorderColor)
                          ),
                          child: XSizedTextField(
                            height: 36,
                            initialValue: _.height,
                            controller: _.heightController,
                            hintText: "请输入高度(cm)",
                          ),
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
                      flex: 2,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // border:
                          //     Border.all(color: BColors.inputBorderColor)
                        ),
                        child: XSizedTextField(
                          height: 36,
                          initialValue: _.deltaY,
                          controller: _.deltaYController,
                          hintText: "请输入离地距离(cm)",
                        ),
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
