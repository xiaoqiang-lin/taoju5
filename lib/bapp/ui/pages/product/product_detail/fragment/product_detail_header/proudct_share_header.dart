import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_detail_header/product_detail_header.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/widgets/product_onsale_tag.dart';

class ProductShareHeader extends StatelessWidget {
  final ProductDetailModel product;
  const ProductShareHeader({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
          horizontal: BDimens.gap16, vertical: BDimens.gap16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                product.name,
                style: TextStyle(
                    fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
              ),
              Visibility(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
                  child: Text(
                    "${product?.fullName}",
                    style: TextStyle(fontSize: BDimens.sp28),
                  ),
                ),
                visible: !GetUtils.isNullOrBlank(product.fullName),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
            child: Row(
              children: [
                Text(
                  "¥${product?.currentSku?.price?.toStringAsFixed(2) ?? product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: BDimens.sp36, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${product.unit}",
                  style: TextStyle(fontSize: BDimens.sp24),
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
          ),
          Visibility(
            visible: product.productType is CurtainProductType,
            child: CurtainProductDetailHeader(),
          )
        ],
      ),
    );
  }
}
