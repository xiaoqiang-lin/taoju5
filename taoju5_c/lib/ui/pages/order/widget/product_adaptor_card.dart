/*
 * @Description: 商品适配器卡片
 * @Author: iamsmiling
 * @Date: 2021-05-14 17:07:23
 * @LastEditTime: 2021-05-28 18:08:36
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/cart/widget/curtain_attribute_key_value_card.dart';

class ProductAdaptorCard extends StatelessWidget {
  final ProductAdaptorEntity product;
  final WidgetBuilder? footerBuilder;
  final Widget? rightTopCorner;
  const ProductAdaptorCard(
      {Key? key,
      required this.product,
      this.footerBuilder,
      this.rightTopCorner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: R.dimen.dp25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ChimeraImage(
                product.image,
                width: R.dimen.dp85,
                height: R.dimen.dp85,
                fit: BoxFit.fill,
                // heroTag: "${product.image}" + "${product.id}",
              ),
              Expanded(
                child: Container(
                  height: R.dimen.dp85,
                  margin: EdgeInsets.only(left: R.dimen.dp6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: R.dimen.dp8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${product.name}",
                              style: TextStyle(
                                  fontSize: R.dimen.dp14,
                                  fontWeight: FontWeight.bold),
                            ),
                            rightTopCorner == null
                                ? SizedBox.shrink()
                                : rightTopCorner!
                          ],
                        ),
                      ),
                      Container(
                          child: Row(
                        children: [
                          Expanded(
                              child: Text("${product.description}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ff999999))),
                          Visibility(
                              visible:
                                  product.productType is FinishedProductType,
                              child: Text("x${product.count}",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ff999999)))
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: product.attributes.isNotEmpty,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: R.dimen.dp10),
              child: CurtainAttributeKeyValueCard(
                  attributes: product.attributes,
                  itemWidth:
                      (R.dimen.width - R.dimen.dp24 * 2 - R.dimen.dp14 * 2) /
                          2),
            ),
          ),
          footerBuilder == null
              ? SizedBox.shrink()
              : Builder(builder: footerBuilder!),
        ],
      ),
    );
  }
}
