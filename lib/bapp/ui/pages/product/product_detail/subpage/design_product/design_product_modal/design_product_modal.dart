import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/design_product_modal/design_product_modal_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/design_product_modal/widget/design_curtain_product_card.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/product_action_bar.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

import 'widget/design_finished_product_card.dart';

class DesignProductModal extends StatelessWidget {
  final DesignProductModel product;
  const DesignProductModal({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignProductModalController>(
        init: DesignProductModalController(designProduct: product),
        autoRemove: true,
        builder: (_) {
          return XBaseModal(
            height: Get.height * 0.84,
            onClose: Get.back,
            builder: (BuildContext context) {
              return Scaffold(
                body: Column(
                  children: [
                    Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                            fontSize: BDimens.sp32,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: BDimens.gap8),
                                          child: Text(
                                            product.fullName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: BDimens.sp32,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "¥${product.totalPrice.toStringAsFixed(2)}",
                                            style: TextStyle(
                                                color: BColors.highLightColor,
                                                fontSize: BDimens.sp36),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: BDimens.gap16),
                                            child: Text(
                                              "¥${product.marketPrice.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: BColors.tipTextColor,
                                                  fontSize: BDimens.sp24),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: BDimens.gap16,
                      thickness: BDimens.gap16,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (ProductModel e in product.productList)
                              if (e.productType is CurtainProductType)
                                DesignCurtainProductCard(
                                    product: e, designProduct: product)
                              else
                                DesignFinishedProductCard(product: e)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(
                      vertical: BDimens.gap32, horizontal: BDimens.gap48),
                  child: ProductActionBar(),
                ),
              );
            },
          );
        });
  }
}
