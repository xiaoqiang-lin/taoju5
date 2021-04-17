import 'package:flutter/material.dart';
import 'package:taoju5_b/domain/model/product/product_mixin_model.dart';

import 'mixin_product_card.dart';

class MixinProductGridView extends StatelessWidget {
  final List<ProductMixinModel> productList;
  const MixinProductGridView({Key key, @required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          childAspectRatio: .72),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int i) {
        return MixinProductCard(product: productList[i]);
      },
    );
  }
}
