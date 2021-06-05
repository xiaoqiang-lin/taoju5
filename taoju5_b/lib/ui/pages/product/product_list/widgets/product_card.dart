/*
 * @Description: 商品卡片
 * @Author: iamsmiling
 * @Date: 2021-01-26 10:17:16
 * @LastEditTime: 2021-01-26 10:28:17
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/product_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/widgets/common/x_cached_network_image.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';
import 'package:taoju5_b/ui/pages/product/widgets/product_onsale_tag.dart';

class ProductGridCard extends StatelessWidget {
  final ProductModel product;

  const ProductGridCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      child: GestureDetector(
        // onTap: () {
        //   if (Get.currentRoute.contains(BAppRoutes.productDetail)) {
        //     String history = Get.parameters["history"];
        //     if (history == null || history == null.toString()) {
        //       history = "${Get.parameters["id"]}o";
        //     }

        //     history += "${product.id}o";

        //     List<String> list = history
        //         .split("o")
        //         ?.where((e) => !GetUtils.isNullOrBlank(e))
        //         ?.toList();

        //     print(list);
        //     if (!GetUtils.isNullOrBlank(list) && list.length > 2) {
        //       String popId = list.removeAt(0);

        //       Get.offNamed(BAppRoutes.productDetail +
        //           "?id=$popId&history=${popId + 'o'}");

        //       print("删除一些页面");
        //     }

        //     // List<String> list = path.split("#");
        //     // if (list.length > 4) {
        //     //   Get.offNamed(BAppRoutes.productDetail);
        //     // }

        //     print(BAppRoutes.productDetail +
        //         "?id=${product.id}&history=$history");
        //     return Get.toNamed(BAppRoutes.productDetail +
        //         "?id=${product.id}&history=$history");
        //   }
        //   return Get.toNamed(BAppRoutes.productDetail + "?id=${product.id}");
        // },
        onTap: () => Get.toNamed(BAppRoutes.productDetail + "/${product.id}",
            arguments: Get.arguments),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: 160,
                height: 160,
                child: XCachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: (BuildContext context, String desc) {
                    return Image.network(product.thumbnail);
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    EdgeInsets.only(left: BDimens.gap20, top: BDimens.gap24),
                child: Row(
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(fontSize: BDimens.sp30),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: BDimens.gap20, top: BDimens.gap12),
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "¥${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${product.unit}",
                      style: TextStyle(
                          fontSize: BDimens.sp24, color: BColors.greyTextColor),
                    ),
                    Visibility(
                      visible: product.isOnsale,
                      child: ProductOnSaleTag(
                        margin: EdgeInsets.only(left: BDimens.gap16),
                        padding: EdgeInsets.symmetric(horizontal: BDimens.gap4),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
