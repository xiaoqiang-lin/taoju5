/*
 * @Description: 设计类商品底部弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-26 09:29:27
 * @LastEditTime: 2021-02-02 14:11:13
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/design_product_modal/design_product_modal.dart';

Future showDesignProductModal({@required String id}) {
  return showCupertinoModalPopup(
      context: Get.context,
      builder: (BuildContext context) {
        return DesignProductModal(id: id);
      });
}
