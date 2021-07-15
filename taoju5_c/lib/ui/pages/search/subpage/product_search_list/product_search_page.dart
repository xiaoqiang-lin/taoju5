/*
 * @Description: 商品搜索结果
 * @Author: iamsmiling
 * @Date: 2021-07-15 14:44:13
 * @LastEditTime: 2021-07-15 15:58:15
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/ui/pages/product/product_list/fragment/single_category_product_list_fragment.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductSearchPage extends StatelessWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("搜索"),
        ),
        body: FutureLoadStateBuilder<ProductListParentController>(
          controller: _,
          builder: (_) {
            return SingleCategoryProductListFragment();
          },
        ),
      );
    });
  }
}
