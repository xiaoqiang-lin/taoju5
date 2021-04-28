/*
 * @Description:商品评论详情
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:17:39
 * @LastEditTime: 2021-04-27 16:17:43
 */
import 'package:get/get.dart';

import 'product_comment_detail_controller.dart';

class ProductCommentDetailBinding extends Bindings {
  @override
  void dependencies() {
    String? id = Get.parameters["id"];
    Get.lazyPut(() => ProductCommentDetailController(id));
  }
}
