/*
 * @Description: 选择窗帘属性的面板
 * @Author: iamsmiling
 * @Date: 2021-01-18 14:39:13
 * @LastEditTime: 2021-01-19 12:15:47
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/curtain_product_attr_modal.dart';

Future showCurtainAttrSelectorModal<T extends BaseAttrSelectorController>(
    {@required String title, @required String tag}) {
  return showCupertinoModalPopup<T>(
      context: Get.context,
      builder: (BuildContext context) {
        return CurtainProductAttrModal<T>(
          title: title,
          tag: tag,
          onConfirm: Get.find<T>(tag: tag).confirm,
        );
      });
}
