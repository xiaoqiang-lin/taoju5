/*
 * @Description: 商品瀑布流布局卡片
 * @Author: iamsmiling
 * @Date: 2021-06-24 15:20:46
 * @LastEditTime: 2021-06-25 16:03:37
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class ProductStaggeredCard extends StatelessWidget {
  final ProductEntity product;
  const ProductStaggeredCard({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
          AppRoutes.category + AppRoutes.productDetail + "/${product.id}"),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChimeraImage(
              product.cover,
              borderRadius: BorderRadius.circular(R.dimen.sp7),
              width: (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp15) / 2.0001,
              height: (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp15) /
                  2.0001 *
                  product.aspectRatio,
              fit: product.fit,
            ),
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp7),
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp3),
              decoration: BoxDecoration(
                color: R.color.ffee9b5f.withOpacity(.08),
              ),
              child: Text(
                product.material,
                style: TextStyle(
                    color: R.color.ffee9b5f,
                    fontSize: R.dimen.sp13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp5, bottom: R.dimen.dp4),
              child: Row(
                children: [
                  Text(product.brand, style: TextStyle(fontSize: R.dimen.sp12)),
                  Text(product.name, style: TextStyle(fontSize: R.dimen.sp12))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: "￥",
                    style: TextStyle(
                        color: R.color.ff333333, fontSize: R.dimen.sp10),
                    children: [
                      TextSpan(
                          text: "${product.price}",
                          style: TextStyle(
                              fontSize: R.dimen.sp14, color: R.color.ffee9b5f)),
                      TextSpan(text: "${product.unit}")
                    ])),
                Text(
                  "${product.saleCount}",
                  style: TextStyle(
                      fontSize: R.dimen.sp10, color: R.color.ff999999),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
