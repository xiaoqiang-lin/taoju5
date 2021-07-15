/*
 * @Description: 商品详情图
 * @Author: iamsmiling
 * @Date: 2021-04-23 16:07:13
 * @LastEditTime: 2021-06-23 09:50:17
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class ProdictDetailImageSection extends StatelessWidget {
  final ProductDetailEntity product;
  const ProdictDetailImageSection({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int i) {
      return ChimeraImage(
        "${product.detailImages[i]}",
        borderRadius: BorderRadius.zero,
        width: R.dimen.width,
        // cacheWidth: R.dimen.width ~/ 1,
      );
    }, childCount: product.detailImages.length));
  }
}
