/*
 * @Description: 型材选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:26:47
 * @LastEditTime: 2021-01-19 15:39:00
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/product/curtain_attr_selector.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_selector_text_field.dart';

class SectionalbarAttrSelectorBar extends StatelessWidget {
  final String tag;
  const SectionalbarAttrSelectorBar({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionalbarAttrSelectorController>(
      tag: tag,
      builder: (_) {
        return Container(
          child: XSelectorTextField(
            label: Text("型材"),
            key: ValueKey(_.value),
            initialValue: _.value,
            onFuture: () => showCurtainAttrSelectorModal<
                SectionalbarAttrSelectorController>(title: "型材更换", tag: tag),
          ),
        );
      },
    );
  }
}
