/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-23 09:40:02
 * @LastEditTime: 2021-07-12 16:12:56
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/school/article_detail_entity.dart';
import 'package:taoju5_c/domain/repository/school_repository.dart';

class ArticleDetailController
    extends BaseFutureLoadStateController<ArticleDetailEntity> {
  SchoolRepository _repository = SchoolRepository();

  late ArticleDetailEntity article;

  @override
  Future<ArticleDetailEntity> loadData({Map? params}) {
    return _repository
        .getArticleDetail({"article_id": Get.parameters["id"]}).then((value) {
      article = value;
      return value;
    });
  }
}
