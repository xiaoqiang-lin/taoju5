/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:44:38
 * @LastEditTime: 2021-02-02 10:30:51
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_detail_banner/product_detail_banner_section_card.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_detail_header/product_detail_header.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_customer_choose_button.dart';
import 'fragment/product_attrs_selector/product_attrs_selector_card.dart';
import 'fragment/product_detail_footer/product_detail_footer.dart';
import 'fragment/product_detail_image_section_view/product_detail_image_section_view.dart';
import 'fragment/product_material_section/product_material_section.dart';
import 'product_detail_skeleton.dart';
import 'fragment/product_mix_section/product_mix_section.dart';
import 'fragment/recommend_product_section/recommend_product_section.dart';
import 'fragment/scene_design_product_section/scene_design_product_section.dart';
import 'fragment/soft_design_product_section/soft_design_product_section.dart';

import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        tag: Get.parameters["id"],
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              ifErrorBack: true,
              animationType: TransitionAnimationType.none,
              loadingWidget: ProductDetailSkeleton(),
              builder: (BuildContext context) {
                return Scaffold(
                  body: NestedScrollView(
                    controller: _.scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          elevation: .5,
                          floating: true,
                          pinned: false,
                          actions: [
                            XCustomerChooseButton(
                              event: ChooseCustomerEventModel(
                                  fromUrl: Get.currentRoute),
                            )
                          ],
                        )
                      ];
                    },
                    body: CustomScrollView(
                      controller: _.scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: ProductDetailBannerCard(
                              imageList: _.product.imageList),
                        ),
                        SliverToBoxAdapter(
                          child: ProductDetailHeader(product: _.product),
                        ),
                        SliverToBoxAdapter(
                          child: GetBuilder<ProductDetailController>(
                              id: "attributeCard",
                              tag: "${_.product.id}",
                              builder: (_) {
                                return ProductAttrsSelectorCard(
                                    tag: "${_.product.id}",
                                    productType: _.product.productType);
                              }),
                        ),
                        SliverToBoxAdapter(
                          child: ProductMixSection(
                            productList: _.mixedProductList,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SceneDesignProductSection(
                              tag: _.id, productList: _.sceneDesignProductList),
                        ),
                        SliverToBoxAdapter(
                          child: SoftDesignProductSection(
                              fromId: _.id,
                              productList: _.softDesignProductList),
                        ),
                        SliverToBoxAdapter(
                          child: ProductMaterialSection(
                            materialList: _.product.materialList,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ProductDetailImageSectionView(
                              imageList: _.product.detailImgList),
                        ),
                        SliverToBoxAdapter(
                          child: RecommendProductSection(
                            productList: _.recomendProductList,
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: ProductDetailFooter(tag: _.tag),
                );
              });
        });
  }
}
