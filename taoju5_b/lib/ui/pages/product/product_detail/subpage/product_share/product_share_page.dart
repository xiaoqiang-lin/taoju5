/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-01-20 13:22:08
 * @LastEditTime: 2021-02-20 15:17:25
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_type.dart';
import 'package:taoju5_b/domain/model/product/product_type.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_detail_banner/product_detail_banner_section_card.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_detail_header/proudct_share_header.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_detail_image_section_view/product_detail_image_section_view.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_material_section/product_material_section.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_skeleton.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/product_share/product_share_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_loadstate_builder.dart';

import 'package:taoju5_b/domain/model/product/product_detail_model.dart';

class ProductSharePage extends StatelessWidget {
  const ProductSharePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductShareController>(builder: (_) {
      return XLoadStateBuilder(
        loadState: _.loadState,
        loadingWidget: ProductDetailSkeleton(),
        retry: _.loadData,
        builder: (BuildContext context) {
          return Scaffold(
            bottomNavigationBar: Visibility(
              visible: _.product.productType is CurtainProductType,
              child: Container(
                color: Get.theme.primaryColor,
                height: kBottomNavigationBarHeight,
                width: Get.width,
                // margin: EdgeInsets.all(BDimens.gap32),

                padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () => Get.toNamed(BAppRoutes.commitOrder,
                        arguments: CommitOrderEvent(
                            productList: [],
                            orderType: OrderType.measureOrder)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: BDimens.gap12),
                      child: Text("预约测量"),
                    )),
              ),
            ),
            body: CustomScrollView(
              slivers: [
                // SliverToBoxAdapter(
                //   child: Container(
                //       color: Get.theme.primaryColor,
                //       child: Column(
                //         mainAxisSize: MainAxisSize.max,
                //         children: [
                //           if (!GetUtils.isNullOrBlank(_.mainImg))
                //             Container(
                //               margin: EdgeInsets.symmetric(horizontal: 24),
                //               height: 396,
                //               width: Get.width,
                //               child: XPhotoViewer(
                //                 url: _.mainImg,
                //                 fit: BoxFit.fitHeight,
                //               ),
                //             )
                //           else
                //             SizedBox(
                //               height: 396,
                //               width: Get.width,
                //               child: ProductDetailBannerCard(
                //                   imageList: _.product.imgList),
                //             )
                //         ],
                //       )),
                // ),
                SliverToBoxAdapter(
                  child: ProductDetailBannerCard(
                    imageList: _.product.imageList,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductShareHeader(
                    product: _.product,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductMaterialSection(
                      materialList: _.product.materialList),
                ),
                SliverToBoxAdapter(
                  child: ProductDetailImageSectionView(
                      imageList: _.product.detailImgList),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
