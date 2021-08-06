/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:04:58
 * @LastEditTime: 2021-08-03 15:13:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/bloc/collect_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/noripple_scroll_behavior/noripple_scroll_behavior.dart';
import 'package:taoju5_c/domain/entity/comment/comment_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/modal/open_share_modal.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/product_detail_skeleton.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/section/product_detail_material_section.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/section/product_scene_design_section.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/section/proudct_detail_footer.dart';
import 'product_detail_controller.dart';
import 'section/product_detail_banner_section.dart';
import 'section/product_detail_comment_section.dart';
import 'section/product_detail_header_section.dart';
import 'section/product_detail_image_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'section/product_yashionset_section.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        tag: Get.parameters["id"],
        autoRemove: false,
        builder: (_) {
          return FutureLoadStateBuilder<ProductDetailController>(
            controller: _,
            tag: _.id,
            loadingBuilder: (BuildContext context) => ProductDetailSkeleton(),
            builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("商品详情"),
                  actions: [
                    CollectButton(
                      category: CollectionCategory.product,
                      id: _.id,
                      like: _.product.like,
                    ),
                    IconButton(
                        icon:
                            Image.asset(R.image.share, color: R.color.ff00000),
                        onPressed: () => openShareModal(context)),
                    IconButton(
                        icon: Image.asset(R.image.cart, color: R.color.ff00000),
                        onPressed: () => Get.toNamed(AppRoutes.cart))
                  ],
                ),
                body: SmartRefresher(
                  enablePullDown: true,

                  ///如果是来自选品页面则没有为你推荐的模块 不允许下拉
                  enablePullUp:
                      !Get.previousRoute.contains(AppRoutes.selectProduct),
                  controller: _.refreshController,
                  // scrollController: _.scrollController,
                  onLoading: _.loadMore,
                  onRefresh: _.refreshData,
                  child: CustomScrollView(
                    scrollBehavior: NoRippleScrollBehavior(),
                    slivers: [
                      SliverToBoxAdapter(
                          child:
                              ProductDetailBannerSection(product: _.product)),
                      SliverToBoxAdapter(
                          child:
                              ProductDetailHeaderSection(product: _.product)),
                      SliverToBoxAdapter(child: Divider()),
                      SliverToBoxAdapter(
                          child: ProductDetailCommentSection(comments: [
                        CommentEntity.sample(),
                        CommentEntity.sample()
                      ])),
                      SliverToBoxAdapter(
                        child: ProductYashionSetSection(),
                      ),
                      SliverToBoxAdapter(
                        child: ProductSceneDesignSection(),
                      ),
                      SliverToBoxAdapter(
                        child: ProductDetailMaterialSection(product: _.product),
                      ),
                      ProdictDetailImageSection(product: _.product),
                      SliverToBoxAdapter(
                        child: Visibility(
                          visible: !Get.previousRoute
                              .contains(AppRoutes.selectProduct),
                          child: CommendationFragment(
                            scrollController: _.scrollController,
                            tag: "product-${_.id}",
                            header: Container(
                              margin: EdgeInsets.only(
                                  left: R.dimen.dp24,
                                  top: R.dimen.dp20,
                                  bottom: R.dimen.dp15),
                              child: Text(
                                "为你推荐",
                                style: TextStyle(
                                    fontSize: R.dimen.sp15,
                                    color: R.color.ff333333,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: ProductDetailFooter(
                  product: _.product,
                  addToCart: _.showAttributePicker,
                  purchase: _.showAttributePicker,
                  select: _.select,
                ),
              );
            },
          );
        });
  }
}
