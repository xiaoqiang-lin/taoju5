/*
 * @Description: 软装方案详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:47:50
 * @LastEditTime: 2021-01-10 14:36:47
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:get/get.dart';

class SoftProductDetailPage extends StatelessWidget {
  const SoftProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("软装方案"),
      ),
      body: GetBuilder<SoftProductDetailController>(
        builder: (_) {
          return XLoadStateBuilder(
            loadState: _.loadState,
            builder: (BuildContext context) {
              return Text("软装方案");
            },
          );
        },
      ),
    );
  }
}
