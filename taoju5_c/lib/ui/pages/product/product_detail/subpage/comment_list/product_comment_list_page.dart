/*
 * @Description:商品评论列表
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:08:56
 * @LastEditTime: 2021-06-04 06:10:06
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/animated_button.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_comment_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_list/product_comment_list_controller.dart';

class ProductCommentListPage extends GetView<ProductCommentListController> {
  const ProductCommentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户评论"),
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: R.dimen.dp20, bottom: kBottomNavigationBarHeight),
        child: FutureLoadStateBuilder<ProductCommentListController>(
            controller: controller,
            builder: (_) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int i) {
                    ProductCommentEntity item = _.comments[i];

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.toNamed(AppRoutes.prefix +
                          AppRoutes.category +
                          AppRoutes.productDetail +
                          "/3226" +
                          AppRoutes.productCommentDetail),
                      child: GetBuilder<ProductCommentListController>(
                          id: "${item.id}",
                          builder: (_) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: R.dimen.dp24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(R.dimen.sp18),
                                        child: Image.network(
                                          item.userAvatar,
                                          width: R.dimen.dp36,
                                          height: R.dimen.dp36,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: R.dimen.dp6),
                                        child: Column(
                                          children: [
                                            Text(
                                              item.username,
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp12),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: R.dimen.dp3),
                                              child: Text(
                                                item.createdAt,
                                                style: TextStyle(
                                                    fontSize: R.dimen.sp10,
                                                    color: R.color.ff999999),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: R.dimen.dp10,
                                          bottom: R.dimen.dp15),
                                      child: Text(
                                        item.content,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(fontSize: R.dimen.sp12),
                                      )),
                                  Visibility(
                                    visible: item.images.isNotEmpty,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(bottom: R.dimen.dp15),
                                      child: Row(
                                        children: [
                                          for (String src in item.images
                                              .sublist(0,
                                                  min(item.images.length, 3)))
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: src != item.images.last
                                                      ? R.dimen.dp14
                                                      : 0),
                                              child: ChimeraImage(
                                                src,
                                                enlarge: true,
                                                // slidable: true,
                                                // images: item.images,
                                                // heroTag: src,
                                                // initialIndex:
                                                // item.images.indexOf(src),
                                                width: (R.dimen.width -
                                                        R.dimen.dp24 * 2 -
                                                        R.dimen.dp14 * 2) /
                                                    3,
                                                height: (R.dimen.width -
                                                        R.dimen.dp24 * 2 -
                                                        R.dimen.dp14 * 2) /
                                                    3,
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                  ObxValue<Rx>(
                                      (Rx data) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              AnimatedButton(
                                                activeWidget: Image.asset(
                                                    R.image.heartFilled),
                                                deactiveWidget: Image.asset(
                                                    R.image.heartBlank),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: R.dimen.dp5),
                                                child: data.value
                                                    ? Text(
                                                        "${item.favorCount}",
                                                        style: TextStyle(
                                                            fontSize:
                                                                R.dimen.sp10,
                                                            color: R.color
                                                                .ffff5005),
                                                      )
                                                    : Text(
                                                        "点赞",
                                                        style: TextStyle(
                                                            fontSize:
                                                                R.dimen.sp10,
                                                            color: R.color
                                                                .ff999999),
                                                      ),
                                              )
                                            ],
                                          ),
                                      item.hasLiked.obs)
                                ],
                              ),
                            );
                          }),
                    );
                  }, childCount: _.comments.length))
                ],
              );
            }),
      ),
    );
  }
}
