/*
 * @Description: 订单评论
 * @Author: iamsmiling
 * @Date: 2021-05-26 09:33:25
 * @LastEditTime: 2021-05-27 16:43:46
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/animated_button.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/button/upload_image_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_detail/section/comment_detail_header.dart';

import 'order_comment_controller.dart';

class OrderCommentPage extends GetView<OrderCommentController> {
  const OrderCommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发表评论"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommentDetailHeader(comment: controller.comment),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: R.dimen.dp20, horizontal: R.dimen.dp24),
              child: Row(
                children: [
                  Text(
                    "商品评分",
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        color: R.color.ff333333,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                margin: EdgeInsets.only(left: R.dimen.dp8),
                                child: AnimatedButton(
                                    activeWidget:
                                        Image.asset(R.image.scoringStar),
                                    deactiveWidget:
                                        Image.asset(R.image.greyScoringStar)),
                              ))),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
              child: TextFormField(
                maxLines: 1,
                style: TextStyle(fontSize: R.dimen.sp12),
                decoration: InputDecoration(
                    prefixIcon: Image.asset(R.image.commentEdit),
                    prefixIconConstraints: BoxConstraints(
                        minHeight: R.dimen.dp12,
                        maxHeight: R.dimen.dp12,
                        maxWidth: R.dimen.dp12),
                    hintText: "写下自己的商品使用感受，可以帮助更多的人哦",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: R.dimen.dp128, left: R.dimen.dp24, right: R.dimen.dp24),
              child: UploadImageButton(
                width: R.dimen.dp80,
                height: R.dimen.dp80,
                color: R.color.transparent,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom,
            left: R.dimen.dp20,
            right: R.dimen.dp20),
        child: PrimaryButton(
          text: "发布",
          onPressed: () {},
          margin: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom + R.dimen.dp8,
          ),
          padding: EdgeInsets.symmetric(vertical: R.dimen.dp13),
        ),
      ),
    );
  }
}
