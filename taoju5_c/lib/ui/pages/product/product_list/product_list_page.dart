/*
 * @Description: 商品列表页面
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:28:28
 * @LastEditTime: 2021-06-01 17:51:55
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

import 'fragment/multiple_category_product_list_fragment.dart';
import 'fragment/single_category_product_list_fragment.dart';

class ProductListPage extends GetView<ProductListParentController> {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.category.name),
          actions: [Image.asset(R.image.find)],
        ),
        body: FutureLoadStateBuilder(
          controller: controller,
          loadingBuilder: (BuildContext context) => SizedBox.shrink(),
          builder: (_) {
            return controller.categories.length > 1
                ? MultipleCategoryProductListFragment()
                : SingleCategoryProductListFragment();
          },
        ));
  }
}
