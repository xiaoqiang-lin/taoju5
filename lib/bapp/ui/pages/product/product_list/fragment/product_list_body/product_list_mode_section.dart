/*
 * @Description: 商品列表 列表模式视图
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:09:44
 * @LastEditTime: 2021-01-19 16:14:48
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';

class ProductListModeSection extends StatelessWidget {
  final List<ProductModel> productList;
  final bool shrinkWrap;
  const ProductListModeSection(
      {Key key, @required this.productList, this.shrinkWrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: shrinkWrap,
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int i) {
          ProductModel e = productList[i];
          return Container(
            child: Column(
              children: [Image.network(e.image)],
            ),
          );
        });
  }
}
