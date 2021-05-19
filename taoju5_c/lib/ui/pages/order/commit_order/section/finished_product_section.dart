/*
 * @Description: 成品区域
 * @Author: iamsmiling
 * @Date: 2021-05-14 17:39:30
 * @LastEditTime: 2021-05-17 17:24:31
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';
import 'package:taoju5_c/ui/pages/order/widget/total_price_tip_bar.dart';

class FinishedProductSection extends StatelessWidget {
  final List<ProductAdaptorEntity> products;
  const FinishedProductSection({Key? key, required this.products})
      : super(key: key);
  double get totalPrice {
    double t = 0;
    for (ProductAdaptorEntity p in products) {
      t += p.totalPrice;
    }
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (ProductAdaptorEntity p in products)
          ProductAdaptorCard(
            product: p,
            rightTopCorner: Text(
              "¥${p.unitPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: R.dimen.sp13,
              ),
            ),
          ),
        TotalPriceTipBar(
          label: "成品小计：",
          totalPrice: totalPrice,
        )
      ],
    );
    // return ListView.separated(
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (BuildContext context, int i) {
    //       return ProductAdaptorCard(product: products[i]);
    //     },
    //     separatorBuilder: (BuildContext context, int i) => Divider(),
    //     itemCount: products.length);
  }
}
