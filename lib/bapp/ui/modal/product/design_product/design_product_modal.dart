/*
 * @Description: 设计类商品底部弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-26 09:29:27
 * @LastEditTime: 2021-02-02 14:11:13
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/product_action_bar.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

Future showDesignProductModal({@required DesignProductModel product}) {
  return showCupertinoModalPopup(
      context: Get.context,
      builder: (BuildContext context) {
        return _XDesignProductModal(product: product);
      });
}

class _XDesignProductModal extends StatelessWidget {
  final DesignProductModel product;
  const _XDesignProductModal({Key key, @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Row(
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
                                  fontSize: BDimens.sp32,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: BDimens.gap8),
                              child: Text(
                                product.fullName,
                                style: TextStyle(
                                    fontSize: BDimens.sp32,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "¥${product.totalPrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: BColors.highLightColor,
                                      fontSize: BDimens.sp36),
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
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: BDimens.gap16,
                thickness: BDimens.gap16,
              ),
              for (ProductModel e in product.productList)
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: BDimens.gap32, horizontal: BDimens.gap32),
                  child: Row(
                    children: [
                      Container(
                          width: 180.w,
                          height: 180.w,
                          child: XPhotoViewer(url: e.image)),
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
                                  fontSize: BDimens.sp28,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: BDimens.gap8),
                                child: Text("默认数据:  宽:3.5米 高2.6米")),
                            GestureDetector(
                              onTap: () => Get.toNamed(
                                  BAppRoutes.editMeasureData +
                                      "/${product.id}"),
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
                            )
                          ],
                        ),
                      ))
                    ],
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
  }
}
