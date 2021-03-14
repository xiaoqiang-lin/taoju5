import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_attr_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class ProductAttrCard extends StatelessWidget {
  final List<ProductAttrAdapterModel> attrList;
  const ProductAttrCard({Key key, @required this.attrList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: attrList.length,
      itemBuilder: (BuildContext context, int index) {
        ProductAttrAdapterModel item = attrList[index];
        return Text(
          "${item.key}:${item.value}",
          style: TextStyle(
              color: BColors.descriptionTextColor, fontSize: BDimens.sp24),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 8),
    );
  }
}
