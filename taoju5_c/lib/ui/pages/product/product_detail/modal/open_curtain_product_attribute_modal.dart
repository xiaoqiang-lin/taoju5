/*
 * @Description:窗帘属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:59:53
 * @LastEditTime: 2021-05-10 11:22:27
 */

import 'package:flutter/cupertino.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_modal.dart';

Future openCurtainProductAttributeModal(BuildContext context,
    {required ProductDetailEntity product,
    required CurtainAttributeEntity attribute}) {
  return showCupertinoModalPopup(
      context: context,
      barrierColor: R.color.ff00000.withOpacity(.6),
      builder: (BuildContext context) {
        return CurtainProductAttributeModal(
          product: product,
          attribute: attribute,
        );
      });
}
