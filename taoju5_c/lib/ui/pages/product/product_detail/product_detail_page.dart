/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:04:58
 * @LastEditTime: 2021-04-27 13:37:07
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/comment/comment_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/section/proudct_detail_footer.dart';
import 'product_detail_controller.dart';
import 'section/product_detail_banner_section.dart';
import 'section/product_detail_comment_section.dart';
import 'section/product_detail_header_section.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureLoadStateBuilder<ProductDetailController>(
      controller: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("商品详情"),
            actions: [
              IconButton(
                  icon: Image.asset(R.image.hasCollected), onPressed: () {}),
              IconButton(
                  icon: Image.asset(R.image.share, color: R.color.ff00000),
                  onPressed: () {}),
              IconButton(
                  icon: Image.asset(R.image.cart, color: R.color.ff00000),
                  onPressed: () {})
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: ProductDetailBannerSection(product: _.product)),
              SliverToBoxAdapter(
                  child: ProductDetailHeaderSection(product: _.product)),
              SliverToBoxAdapter(child: Divider()),
              SliverToBoxAdapter(
                  child: ProductDetailCommentSection(comments: [
                CommentEntity.sample(),
                CommentEntity.sample()
              ])),
              // ProdictDetailImageSection(product: _.product)
            ],
          ),
          bottomNavigationBar: ProductDetailFooter(product: _.product),
        );
      },
    );
  }
}
