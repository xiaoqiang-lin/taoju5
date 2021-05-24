/*
 * @Description: 商品评论详情
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:10:16
 * @LastEditTime: 2021-05-19 17:21:44
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/comment/comment_detail_entity.dart';

class ProductCommentDetailController
    extends BaseFutureLoadStateController<CommentDetaiEntity> {
  String? id;

  ProductCommentDetailController(this.id);

  late CommentDetaiEntity comment;

  @override
  Future<CommentDetaiEntity> loadData({Map? params}) {
    comment = CommentDetaiEntity.fromJson({});
    return Future.value(comment);
  }
}
