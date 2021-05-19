/*
 * @Description: 商品详情图
 * @Author: iamsmiling
 * @Date: 2021-04-23 16:07:13
 * @LastEditTime: 2021-05-15 12:17:56
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

class ProdictDetailImageSection extends StatelessWidget {
  final ProductDetailEntity product;
  const ProdictDetailImageSection({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return SliverList(
    //     delegate: SliverChildBuilderDelegate((BuildContext context, int i) {
    //   return ChimeraImage(imageUrl: product.detailImages[i]);
    // }, childCount: product.images.length));
  }
}
