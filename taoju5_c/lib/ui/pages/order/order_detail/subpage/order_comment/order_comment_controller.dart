/*
 * @Description: 订单评论
 * @Author: iamsmiling
 * @Date: 2021-05-26 09:33:40
 * @LastEditTime: 2021-07-16 10:41:11
 */

import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/comment/comment_detail_entity.dart';

class OrderCommentController extends GetxController {
  late Map formData = {};
  late CommentDetaiEntity comment = CommentDetaiEntity.fromJson({});
}
