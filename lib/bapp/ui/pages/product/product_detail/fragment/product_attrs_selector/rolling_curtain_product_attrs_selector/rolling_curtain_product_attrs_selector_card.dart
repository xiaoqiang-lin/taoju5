/*
 * @Description: 卷帘商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:16:09
 * @LastEditTime: 2021-02-01 16:58:01
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/rolling_curtain_product_attrs_selector/rolling_curtain_product_attrs_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';

class RollingCurtainProductAttrsSelectorCard extends StatelessWidget {
  const RollingCurtainProductAttrsSelectorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RollingCurtainProductAttrsSelectorController>(
      builder: (_) {
        return Column(
          children: [
            for (CurtainProductAttrModel e in _.attrList)
              Row(
                children: [Text(e.typeName), Text(e.currentOptionName)],
              )
          ],
        );
      },
      initState: (_) {
        ProductDetailController productDetailController =
            Get.find<ProductDetailController>();
        productDetailController.selectorController =
            Get.find<RollingCurtainProductAttrsSelectorController>();
      },
    );
  }
}
