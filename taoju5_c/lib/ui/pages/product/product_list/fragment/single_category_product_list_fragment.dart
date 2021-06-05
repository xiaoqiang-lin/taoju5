/*
 * @Description: 单一分类
 * @Author: iamsmiling
 * @Date: 2021-05-27 11:08:16
 * @LastEditTime: 2021-05-27 17:24:33
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taoju5_c/ui/pages/product/product_list/fragment/product_list_view_section.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_list/widget/product_list_tool_bar.dart';

class SingleCategoryProductListFragment extends StatelessWidget {
  const SingleCategoryProductListFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(
      builder: (_) {
        return Column(
          children: [
            ProductListToolBar(),
            Expanded(child: ProductListViewSection(category: _.category))
          ],
        );
      },
    );
  }
}
