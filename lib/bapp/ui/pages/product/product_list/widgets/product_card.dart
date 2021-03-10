/*
 * @Description: 商品卡片
 * @Author: iamsmiling
 * @Date: 2021-01-26 10:17:16
 * @LastEditTime: 2021-01-26 10:28:17
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

import 'package:taoju5/bapp/routes/bapp_pages.dart';

class ProductGridCard extends StatelessWidget {
  final ProductModel product;
  const ProductGridCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(BAppRoutes.productDetail + "/${product.id}",
          arguments: product.productType),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: 320.w,
              child: AspectRatio(
                  aspectRatio: 1.0, child: Image.network(product.image)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: BDimens.gap20, top: BDimens.gap24),
              child: Row(
                children: [
                  Text(
                    product.name,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: BDimens.gap20, top: BDimens.gap12),
              alignment: Alignment.centerLeft,
              child: Text("¥${product.price.toStringAsFixed(2)}"),
            )
          ],
        ),
      ),
    );
  }
}
