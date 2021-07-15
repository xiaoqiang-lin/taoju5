/*
 * @Description: 订单评论
 * @Author: iamsmiling
 * @Date: 2021-05-26 09:33:40
 * @LastEditTime: 2021-07-12 15:13:00
 */

import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/comment/comment_detail_entity.dart';
import 'package:dio/dio.dart' as dio;

class OrderCommentController extends GetxController {
  late dio.FormData formData = dio.FormData();
  late CommentDetaiEntity comment = CommentDetaiEntity.fromJson({});
}
