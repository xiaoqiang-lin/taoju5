/*
 * @Description: 商品评论详情
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:10:41
 * @LastEditTime: 2021-06-08 17:35:54
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/animated_button.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_detail/section/comment_detail_body.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_detail/section/comment_detail_header.dart';

import 'product_comment_detail_controller.dart';

class ProductCommentDetailPage extends GetView<ProductCommentDetailController> {
  const ProductCommentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评论详情"),
      ),
      body: FutureLoadStateBuilder<ProductCommentDetailController>(
          controller: controller,
          builder: (ProductCommentDetailController _) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CommentDetailHeader(comment: _.comment),
                ),
                SliverToBoxAdapter(
                  child: CommentDetailBody(comment: _.comment),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int i) {
                  return Container(
                      margin: EdgeInsets.only(bottom: R.dimen.dp10),
                      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                      child: ChimeraImage(_.comment.pictures[i]));
                }, childCount: _.comment.pictures.length))
              ],
            );
          }),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedButton(
              activeWidget: Image.asset(R.image.heartFilled),
              deactiveWidget: Image.asset(R.image.heartBlank),
              onPressed: () => Future.value(true),
            ),
            Container(
              margin: EdgeInsets.only(left: R.dimen.dp8),
              child: Text("${controller.comment.likeCount}"),
            )
          ],
        ),
      ),
    );
  }
}
