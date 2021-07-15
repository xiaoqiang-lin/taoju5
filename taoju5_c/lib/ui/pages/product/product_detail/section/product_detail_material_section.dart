/*
 * @Description: 成分信息
 * @Author: iamsmiling
 * @Date: 2021-06-22 16:12:40
 * @LastEditTime: 2021-06-26 16:00:31
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class ProductDetailMaterialSection extends StatelessWidget {
  final ProductDetailEntity product;
  const ProductDetailMaterialSection({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: product.materialSet.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: R.dimen.dp20, bottom: R.dimen.dp12),
            child: Text(
              "商品信息",
              style: R.style.h3,
            ),
          ),
          for (ProductMaterialEntity m in product.materialSet)
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp10, left: R.dimen.dp24),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        m.key,
                        style: TextStyle(
                            fontSize: R.dimen.sp13, color: R.color.ff999999),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        m.value,
                        style: TextStyle(
                            fontSize: R.dimen.sp13, color: R.color.ff333333),
                      ))
                ],
              ),
            ),
          Container(
            width: R.dimen.width,
            height: 1,
            color: R.color.fff5f5f5,
            margin: EdgeInsets.only(top: R.dimen.dp20, bottom: R.dimen.dp10),
          )
        ],
      ),
    );
  }
}
