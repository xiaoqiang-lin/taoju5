/*
 * @Description: 产品搭配
 * @Author: iamsmiling
 * @Date: 2021-01-08 16:54:18
 * @LastEditTime: 2021-01-26 17:55:47
 */
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/modal/product/mixed_product.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/x_title_bar.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_swiper.dart';

class ProductMixSection extends StatelessWidget {
  final List<ProductModel> productList;
  const ProductMixSection({Key key, this.productList = const []})
      : super(key: key);

  int get len => productList.length;
  //共有多少组
  int get groupCount {
    int mod = len % 3;
    int div = len ~/ 3;
    return mod > 0 ? div + 1 : div;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Container(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.only(top: BDimens.gap16),
          padding: EdgeInsets.symmetric(
              horizontal: BDimens.gap16, vertical: BDimens.gap16),
          child: Column(
            children: [
              XTitleBar(
                onTap: () =>
                    showMixedProductModal(context, productList: productList),
                title: "搭配精选",
              ),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap24),
                height: 180.h,
                child: XSwiper(
                    itemCount: groupCount,
                    itemBuilder: (BuildContext context, int i) {
                      List<ProductModel> list = productList.sublist(i, i + 3);
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (ProductModel e in list)
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                        BAppRoutes.productDetail + "/${e.id}"),
                                    child: SizedBox(
                                      height: 160.h,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Image.network(
                                          e.image,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ],
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
