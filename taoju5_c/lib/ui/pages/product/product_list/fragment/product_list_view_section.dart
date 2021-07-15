/*
 * @Description: 商品列表
 * @Author: iamsmiling
 * @Date: 2021-05-27 16:05:29
 * @LastEditTime: 2021-07-01 14:30:41
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_card.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

import '../product_list_skeleton.dart';

class ProductListViewSection extends StatelessWidget {
  final CategoryEntity category;
  const ProductListViewSection({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: GetBuilder<ProductListParentController>(
        builder: (_) {
          return _.viewMode == PeoductViewMode.gridMode
              ? PullToRefreshGridViewBuilder<ProductListController,
                  ProductEntity>(
                  tag: "${category.id}",
                  loadingBuilder: (BuildContext context) =>
                      ProductListSkeleton(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: R.dimen.dp16,
                      childAspectRatio: 160 / 236,
                      mainAxisSpacing: R.dimen.dp16),
                  itemBuilder: (ProductEntity p) => ProductCard(product: p),
                )
              : PullToRefreshListViewBuilder<ProductListController,
                  ProductEntity>(
                  tag: "${category.id}",
                  itemBuilder: (ProductEntity p) => ProductPlusCard(
                    product: p,
                    width: R.dimen.width - R.dimen.dp20 * 2,
                  ),
                );
        },
      ),
    );
  }
}
