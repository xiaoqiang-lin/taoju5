/*
 * @Description: 商品详情头部
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:33:30
 * @LastEditTime: 2021-06-04 07:23:02
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import '../product_detail_controller.dart';

class ProductDetailHeaderSection extends StatelessWidget {
  final ProductDetailEntity product;
  const ProductDetailHeaderSection({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp18, bottom: R.dimen.dp20),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      color: R.color.ff333333,
                      fontSize: R.dimen.sp14,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp10),
                  child: Row(
                    children: [
                      Text.rich(TextSpan(
                          text: "¥ ",
                          style: TextStyle(fontSize: R.dimen.sp10),
                          children: [
                            TextSpan(
                              text:
                                  "${product.currentSku?.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: R.color.ff5005,
                                  fontSize: R.dimen.sp14),
                            ),
                            TextSpan(
                              text: "${product.unit}",
                            )
                          ])),
                      Spacer(),
                      Text(
                        "${product.saleCount}人已购买",
                        style: TextStyle(
                            color: R.color.ff999999, fontSize: R.dimen.sp10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
          if (product.productType is RollingCurtainProductType)
            GestureDetector(
              onTap: _.openRollingCurtainProductAttributeDialog,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: R.dimen.dp20, horizontal: R.dimen.dp20),
                child: Row(
                  children: [
                    Text(
                      "选择规格(卷帘)",
                      style: TextStyle(fontSize: R.dimen.sp12),
                    ),
                    Spacer(),
                    Text(
                      "${product.specTip}",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: R.dimen.dp6),
                      child: Image.asset(
                        R.image.next,
                        color: R.color.ffee9b5f,
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (product.productType is SectionbarProductType)
            GestureDetector(
              onTap: _.openSectionalbarProductAttributeDialog,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: R.dimen.dp20, horizontal: R.dimen.dp20),
                child: Row(
                  children: [
                    Text(
                      "选择规格(型材)",
                      style: TextStyle(fontSize: R.dimen.sp12),
                    ),
                    Spacer(),
                    Text(
                      "${product.specTip}",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: R.dimen.dp6),
                      child: Image.asset(
                        R.image.next,
                        color: R.color.ffee9b5f,
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (product.productType is FinishedProductType &&
              product.productType is! SectionbarProductType)
            GestureDetector(
              onTap: _.openFinishedProductAttributeModal,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: R.dimen.dp20, horizontal: R.dimen.dp20),
                child: Row(
                  children: [
                    Text(
                      "选择规格",
                      style: TextStyle(fontSize: R.dimen.sp12),
                    ),
                    Spacer(),
                    Text(
                      "${product.specTip}",
                      key: ValueKey("${product.specTip}"),
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: R.dimen.dp6),
                      child: Image.asset(
                        R.image.next,
                        color: R.color.ffee9b5f,
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (product.productType is FabricCurtainProductType)
            GestureDetector(
              onTap: _.openCurtainProductAttributeModal,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: R.dimen.dp20, horizontal: R.dimen.dp20),
                child: Row(
                  children: [
                    Text(
                      "报价单",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "${product.specTip}",
                      style: TextStyle(
                          fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: R.dimen.dp6),
                      child: Image.asset(
                        R.image.next,
                        color: R.color.ffee9b5f,
                      ),
                    )
                  ],
                ),
              ),
            ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: R.dimen.dp20, horizontal: R.dimen.dp20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: R.dimen.dp5),
                  child: Image.asset(R.image.nearby),
                ),
                Text(
                  "附近实体门店",
                  style: TextStyle(
                      fontSize: R.dimen.sp12, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "店铺名称,店铺名称,店铺...",
                  style: TextStyle(
                      fontSize: R.dimen.sp12, color: R.color.ffee9b5f),
                ),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp6),
                  child: Image.asset(
                    R.image.next,
                    color: R.color.ffee9b5f,
                  ),
                )
              ],
            ),
          )
        ],
      );
    });
  }
}
