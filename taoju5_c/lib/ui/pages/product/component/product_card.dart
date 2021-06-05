/*
 * @Description: 商品卡片
 * @Author: iamsmiling
 * @Date: 2021-05-19 10:40:00
 * @LastEditTime: 2021-06-04 18:04:54
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final double? width;
  final bool brandVisible;

  const ProductCard(
      {Key? key, required this.product, this.width, this.brandVisible = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.prefix +
          AppRoutes.category +
          AppRoutes.productDetail +
          "/${product.id}"),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  product.cover,
                  width: width,
                  height: width,
                ),
                Positioned(right: 0, child: Image.asset(R.image.hotTag))
              ],
            ),
            Container(
              color: R.color.ffee9b5f.withOpacity(.08),
              child: Text(
                " ${product.material} ",
                style: TextStyle(
                    color: R.color.ffee9b5f,
                    fontSize: R.dimen.sp13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: R.dimen.dp5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: brandVisible,
                      child: Text("【${product.brand}】",
                          style: TextStyle(fontSize: R.dimen.sp12)),
                    ),
                    Expanded(
                      child: Text("${product.name}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: R.dimen.sp12)),
                    ),
                  ],
                )),
            Container(
              width: width,
              margin: EdgeInsets.only(top: R.dimen.dp5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: "¥",
                      style: TextStyle(
                          color: R.color.ff333333, fontSize: R.dimen.sp10),
                      children: [
                        TextSpan(
                            text: "${product.price}",
                            style: TextStyle(
                                fontSize: R.dimen.sp14,
                                color: R.color.ffee9b5f)),
                        TextSpan(text: "${product.unit}"),
                      ])),
                  Text(
                    "${product.saleCount}",
                    style: TextStyle(
                        fontSize: R.dimen.sp10, color: R.color.ff999999),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductPlusCard extends StatelessWidget {
  final ProductEntity product;
  final double? width;
  final bool brandVisible;
  const ProductPlusCard(
      {Key? key, required this.product, this.width, this.brandVisible = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.prefix +
          AppRoutes.category +
          AppRoutes.productDetail +
          "/${product.id}"),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  product.cover,
                  width: width,
                  height: width,
                ),
                Positioned(right: 0, child: Image.asset(R.image.hotTag))
              ],
            ),
            Text(
              " ${product.material} ",
              style: TextStyle(
                  backgroundColor: R.color.ffee9b5f.withOpacity(.08),
                  color: R.color.ffee9b5f,
                  fontSize: R.dimen.sp13,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(top: R.dimen.dp5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: brandVisible,
                      child: Text("【${product.brand}】",
                          style: TextStyle(fontSize: R.dimen.sp12)),
                    ),
                    Text("${product.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: R.dimen.sp12)),
                  ],
                )),
            Container(
              width: width,
              margin: EdgeInsets.only(top: R.dimen.dp5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      text: "¥",
                      style: TextStyle(
                          color: R.color.ff333333, fontSize: R.dimen.sp10),
                      children: [
                        TextSpan(
                            text: "${product.price}",
                            style: TextStyle(
                                fontSize: R.dimen.sp14,
                                color: R.color.ffee9b5f)),
                        TextSpan(text: "${product.unit}"),
                      ])),
                  Text(
                    "${product.saleCount}",
                    style: TextStyle(
                        fontSize: R.dimen.sp10, color: R.color.ff999999),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
