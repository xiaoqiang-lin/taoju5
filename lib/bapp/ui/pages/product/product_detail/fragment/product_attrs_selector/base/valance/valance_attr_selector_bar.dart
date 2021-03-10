/*
 * @Description: 幔头选择
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:31:16
 * @LastEditTime: 2021-01-18 14:51:25
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

class ValanceAttrSelectorBar extends StatelessWidget {
  final String tag;
  const ValanceAttrSelectorBar({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ValanceAttrSelectorController>(
      tag: tag,
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("幔头"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () =>
                showCurtainAttrSelectorModal<ValanceAttrSelectorController>(
                    title: "幔头选择", tag: tag),
          ),
        );
      },
    );
  }
}
