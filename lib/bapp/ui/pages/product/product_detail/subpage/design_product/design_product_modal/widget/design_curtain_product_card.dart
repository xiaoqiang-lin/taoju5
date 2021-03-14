import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignCurtainProductCard extends StatelessWidget {
  final DesignProductModel designProduct;
  final ProductModel product;
  const DesignCurtainProductCard(
      {Key key, @required this.product, @required this.designProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: BDimens.gap32, horizontal: BDimens.gap32),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 180.w,
                  height: 180.w,
                  child: XPhotoViewer(url: product.image)),
              Expanded(
                  child: Container(
                height: 180.w,
                margin: EdgeInsets.only(left: BDimens.gap24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: BDimens.sp28, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: BDimens.gap8),
                        child: Text(
                            "默认数据:  宽:${product?.width}米 高:${product?.height}米")),
                    GestureDetector(
                      onTap: () => Get.toNamed(
                          BAppRoutes.editMeasureData + "/${product?.id}"),
                      child: Row(
                        children: [
                          Text(
                            "修改测装数据",
                            style: TextStyle(
                                fontSize: BDimens.sp24,
                                color: BColors.lightAccentColor),
                          ),
                          Icon(BIcons.next,
                              size: BDimens.sp28,
                              color: BColors.lightAccentColor)
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "¥${product.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: BColors.highLightColor,
                              fontSize: BDimens.sp28),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: BDimens.gap16),
                          child: Text(
                            "¥${product.marketPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: BColors.tipTextColor,
                                fontSize: BDimens.sp24),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: BDimens.gap24, bottom: BDimens.gap16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "属性:",
                  style: TextStyle(
                      fontSize: BDimens.sp24, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(BAppRoutes.modifyCurtainProductAttr +
                      "/${product?.id}/0"),
                  child: Row(
                    children: [
                      Text(
                        "修改属性",
                        style: TextStyle(
                            fontSize: BDimens.sp24,
                            color: BColors.lightAccentColor),
                      ),
                      Icon(BIcons.next,
                          size: BDimens.sp28, color: BColors.lightAccentColor)
                    ],
                  ),
                )
              ],
            ),
          ),
          GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 8.2,
            children: [
              for (CurtainProductAttrAdapterModel attr in product.attrList)
                Text(
                  "${attr?.key}: ${attr?.value}",
                  style: TextStyle(
                      fontSize: BDimens.sp24, color: BColors.greyTextColor),
                )
            ],
          )
        ],
      ),
    );
  }
}
