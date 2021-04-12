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
import 'package:taoju5/bapp/res/b_colors.dart';
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
    int div = len ~/ 3;
    return div;
  }

  int get mod {
    return len % 3;
  }

  List<List<ProductModel>> get list {
    List<List<ProductModel>> l = [];
    for (int i = 0; i < groupCount; i++) {
      l.add(productList.sublist(i * 3, i * 3 + 3));
    }
    if (mod > 0) {
      l.add(productList.sublist(groupCount * 3));
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Container(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.only(top: BDimens.gap16),
          padding: EdgeInsets.symmetric(
              horizontal: BDimens.gap16, vertical: BDimens.gap24),
          child: Column(
            children: [
              XTitleBar(
                onTap: () =>
                    showMixedProductModal(context, productList: productList),
                title: "搭配精选",
              ),
              Container(
                // margin: EdgeInsets.only(bottom: BDimens.gap16),
                height: 248.h,
                child: XSwiper(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int i) {
                      bool lessThan3 = list[i].length < 3;
                      return Container(
                        child: Row(
                          mainAxisAlignment: lessThan3
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.spaceAround,
                          children: [
                            for (ProductModel e in list[i])
                              Container(
                                margin: EdgeInsets.only(
                                    right: lessThan3 ? BDimens.gap48 : 0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.toNamed(
                                          BAppRoutes.productDetail +
                                              "/${e.id}"),
                                      child: Container(
                                          child: Column(
                                        children: [
                                          SizedBox(
                                            height: 160.h,
                                            child: AspectRatio(
                                              aspectRatio: 1.0,
                                              child: Image.network(
                                                e.image,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: BDimens.gap8),
                                              child: Text(e.name)),
                                          Row(
                                            children: [
                                              Text(
                                                "¥${e.price.toStringAsFixed(2)}",
                                                style: TextStyle(
                                                    fontSize: BDimens.sp26,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                e.unit,
                                                style: TextStyle(
                                                    fontSize: BDimens.sp20,
                                                    color:
                                                        BColors.greyTextColor),
                                              )
                                            ],
                                          )
                                        ],
                                      )),
                                    )
                                  ],
                                ),
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
