/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:09:22
 * @LastEditTime: 2021-04-27 16:43:10
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/product/product_comment_entity.dart';

class ProductCommentListController
    extends BaseFutureLoadStateController<List<ProductCommentEntity>> {
  List<ProductCommentEntity> comments =
      List.generate(6, (index) => ProductCommentEntity.sample());

  @override
  Future<List<ProductCommentEntity>> loadData({Map? params}) {
    return Future.value(comments);
  }
}
