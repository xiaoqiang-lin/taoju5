/*
 * @Description: 成品属性选择
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:20:50
 * @LastEditTime: 2020-12-23 09:21:42
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/ui/modal/product/finished_product.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/finished_product_attrs_selector/finished_product_attrs_controller.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/utils/common_kit.dart';

class FinishedProductAttrsSelectorBar extends StatelessWidget {
  final String tag;
  const FinishedProductAttrsSelectorBar({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinishedProductAttrsController>(
        tag: tag,
        builder: (_) {
          return GestureDetector(
            onTap: () => showFinishedProductAttrModal(context,
                product: _.product, id: tag),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("选择"),
                    Text("请选择${_.product.tip}"),
                    Spacer(),
                    Icon(
                      BIcons.three_dot,
                      color: Colors.black,
                    )
                  ],
                ),
                Visibility(
                  visible: !CommonKit.isNullOrZero(_.product.colorCount),
                  child: Row(
                    children: [Text("共${_.product.colorCount}种颜色分类可选")],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
