/*
 * @Description: 成品属性选择
 * @Author: iamsmiling
 * @Date: 2020-12-23 09:20:50
 * @LastEditTime: 2020-12-23 09:21:42
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';

class FinishedProductAttrsSelector extends StatelessWidget {
  final String tag;
  const FinishedProductAttrsSelector({Key key, @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Column(
        children: [
          Row(
            children: [
              Text("选择"),
            ],
          )
        ],
      );
    });
  }
}
