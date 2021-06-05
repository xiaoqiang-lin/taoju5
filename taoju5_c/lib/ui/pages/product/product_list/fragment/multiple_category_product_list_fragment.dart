/*
 * @Description: 多类别商品
 * @Author: iamsmiling
 * @Date: 2021-05-27 14:12:20
 * @LastEditTime: 2021-06-01 17:53:14
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_list/widget/product_list_tool_bar.dart';

import 'product_list_view_section.dart';

class MultipleCategoryProductListFragment extends StatelessWidget {
  const MultipleCategoryProductListFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(
      builder: (_) {
        return Column(
          children: [
            Container(
              width: R.dimen.width,
              child: Stack(
                children: [
                  TabBar(
                      isScrollable: true,
                      controller: _.tabController,
                      tabs: [
                        for (CategoryEntity e in _.categories)
                          Tab(child: Text(e.name))
                      ]),
                  Positioned(
                    child: Image.asset(R.image.mask),
                    right: 0,
                  )
                ],
              ),
            ),
            ProductListToolBar(),
            Expanded(
                child: TabBarView(
              controller: _.tabController,
              children: [
                for (CategoryEntity c in _.categories)
                  ProductListViewSection(
                    category: c,
                  )
              ],
            ))
          ],
        );
      },
    );
  }
}
