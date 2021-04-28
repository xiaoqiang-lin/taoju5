/*
 * @Description: 商品评论详情
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:10:41
 * @LastEditTime: 2021-04-27 17:57:21
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_comment_detail_controller.dart';

class ProductCommentDetailPage extends GetView<ProductCommentDetailController> {
  const ProductCommentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评论详情"),
      ),
      body: CustomScrollView(
        slivers: [],
      ),
    );
  }
}
