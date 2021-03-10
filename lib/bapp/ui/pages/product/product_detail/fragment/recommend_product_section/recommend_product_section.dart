/*
 * @Description: 为你推荐
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:27:57
 * @LastEditTime: 2021-02-02 10:31:06
 */

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/x_title_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/widgets/product_card.dart';

class RecommendProductSection extends StatelessWidget {
  final List<ProductModel> productList;

  const RecommendProductSection({Key key, this.productList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
              child: XTitleBar(title: "为你推荐")),
          Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: productList.length,
                  physics: NeverScrollableScrollPhysics(),
                  // controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.84,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    return ProductGridCard(
                      product: productList[i],
                    );
                  }))
        ],
      ),
    );
  }
}
