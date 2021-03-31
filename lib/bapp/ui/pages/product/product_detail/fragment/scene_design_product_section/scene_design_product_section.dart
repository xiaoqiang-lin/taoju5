/*
 * @Description: 场景推荐
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:25:08
 * @LastEditTime: 2021-02-02 13:33:17
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/x_title_bar.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_swiper.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_thumbnail_card.dart';
import 'dart:math';

class SceneDesignProductSection extends StatelessWidget {
  final String tag;
  final List<DesignProductModel> productList;
  const SceneDesignProductSection(
      {Key key, this.productList = const [], @required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Container(
        margin: EdgeInsets.only(top: BDimens.gap16),
        padding: EdgeInsets.symmetric(
            horizontal: BDimens.gap16, vertical: BDimens.gap16),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            XTitleBar(title: "场景推荐"),
            AspectRatio(
              aspectRatio: 1.08,
              child: Container(
                child: XSwiper(
                  itemCount: productList.length,
                  viewportFraction: 1,
                  itemBuilder: (BuildContext context, int i) {
                    return _SceneDesignProductCard(
                      product: productList[i],
                      fromId: tag,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SceneDesignProductCard extends StatelessWidget {
  final DesignProductModel product;
  final String fromId;
  const _SceneDesignProductCard(
      {Key key, @required this.product, @required this.fromId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: AspectRatio(
        aspectRatio: .68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(BAppRoutes.sceneProductDetail +
                  "?fromId=$fromId&id=${product.id}"),
              child: ClipRRect(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: Get.width * .6,
                        child: Image.network(
                          // height: Get.width,
                          product.image,
                          width: Get.width,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          child: Image.asset(
                            "assets/images/shadow_mask.png",
                            width: Get.width,
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.all(BDimens.gap32),
                          child: Text("${product.tag}",
                              style: TextStyle(
                                  color: BColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: BDimens.sp28)),
                        ))
                  ],
                ),
              ),
            ),
            AspectRatio(
                aspectRatio: 4,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        itemCount: min(5, product?.productList?.length ?? 0),
                        padding: EdgeInsets.only(top: BDimens.gap8, bottom: 0),
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: .78,
                          crossAxisSpacing: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          ProductMixinModel o = product.productList[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => Get.toNamed(
                                BAppRoutes.productDetail + "/${o.id}"),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    XThumbnailCard(
                                        child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.network(o.image),
                                    )),
                                    Container(
                                      color: index == 4
                                          ? Colors.black.withAlpha(80)
                                          : null,
                                      width: MediaQuery.of(context).size.width,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: index == 4
                                            ? Icon(BIcons.three_dot)
                                            : null,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: BDimens.gap8),
                                  child: Text(
                                    "¥${o.price.toStringAsFixed(2)}",
                                    style: TextStyle(fontSize: BDimens.sp24),
                                  ),
                                )
                              ],
                            ),
                          );
                        })))
          ],
        ),
      ),
    );
  }
}
