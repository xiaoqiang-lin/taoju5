import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/accessory/accessory_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_bar.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_bar.dart';

///修改窗帘属性的页面
class ModifyCurtainProductAttrPage
    extends GetView<ModifyCurtainProductAttrController> {
  const ModifyCurtainProductAttrPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        title: Text("修改属性"),
      ),
      body: Container(
        color: Get.theme.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
        child: Column(
          children: [
            GauzeAttrSelectorBar(tag: controller.tag),
            SectionalbarAttrSelectorBar(tag: controller.tag),
            ValanceAttrSelectorBar(tag: controller.tag),
            RibouxAttrSelectorBar(tag: controller.tag),
            AccessoryAttrSelectorBar(tag: controller.tag)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(BDimens.gap32),
        width: Get.width,
        height: kBottomNavigationBarHeight,
        child: ElevatedButton(
          child: Text("确定"),
          onPressed: controller.confirm,
        ),
      ),
    );
  }
}
