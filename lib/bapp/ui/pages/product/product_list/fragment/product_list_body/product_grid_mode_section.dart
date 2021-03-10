/*
 * @Description:商品列表 网格模式视图
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:17:59
 * @LastEditTime: 2021-01-26 11:04:59
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/widgets/product_card.dart';

class ProductGridModeSection extends StatelessWidget {
  final List<ProductModel> productList;
  final bool shrinkWrap;
  const ProductGridModeSection(
      {Key key, @required this.productList, this.shrinkWrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.84,
          // crossAxisSpacing: 24,
        ),
        itemBuilder: (BuildContext context, int i) {
          return ProductGridCard(product: productList[i]);
        });
  }
}
