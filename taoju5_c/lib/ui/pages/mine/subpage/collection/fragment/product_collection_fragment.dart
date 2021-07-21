/*
 * @Description: 商品收藏
 * @Author: iamsmiling
 * @Date: 2021-07-16 15:08:01
 * @LastEditTime: 2021-07-16 15:27:25
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/collection_repository.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_card.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_skeleton.dart';

class ProdcutCollectionFragmentController
    extends PullToRefreshListViewBuilderController<ProductEntity> {
  List<ProductEntity> productList = [];

  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    CollectionRepository repository = CollectionRepository();
    return repository.productCollection().then((value) {
      productList = value;
      return value;
    });
  }
}

class ProductCollectionFragment extends StatelessWidget {
  const ProductCollectionFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PullToRefreshGridViewBuilder<ProdcutCollectionFragmentController,
        ProductEntity>(
      // tag: "${category.id}",
      padding: EdgeInsets.only(left: R.dimen.dp20, right: R.dimen.dp20),
      loadingBuilder: (BuildContext context) => ProductListSkeleton(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: R.dimen.dp16,
          childAspectRatio: 160 / 236,
          mainAxisSpacing: R.dimen.dp16),
      itemBuilder: (ProductEntity p) => ProductCard(product: p),
    );
  }
}
