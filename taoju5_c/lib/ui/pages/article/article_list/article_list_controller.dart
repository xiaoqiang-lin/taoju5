/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-07-23 16:47:19
 * @LastEditTime: 2021-07-23 17:36:33
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/domain/entity/school/topic_article_entity.dart';
import 'package:taoju5_c/domain/repository/school_repository.dart';

class ArticleListParentController
    extends BaseFutureLoadStateController<List<CategoryEntity>> {
  TopicArticleEntity topic = Get.arguments;
  SchoolRepository _repository = SchoolRepository();
  List<CategoryEntity> categories = [];
  @override
  Future<List<CategoryEntity>> loadData({Map? params}) {
    return _repository.getTopicTabs(params).then((value) {
      categories = value;
      categories.forEach((e) {
        Get.lazyPut(() => ArticleListController(e), tag: "${e.type}");
      });
      return value;
    });
  }
}

class ArticleListController
    extends PullToRefreshListViewBuilderController<CourseEntity> {
  final CategoryEntity category;
  SchoolRepository _repository = SchoolRepository();

  ArticleListController(this.category);

  List<CourseEntity> articles = [];
  @override
  Future<List<CourseEntity>> loadData({Map? params}) {
    return _repository.getCourseList({"type": category.type}).then((value) {
      articles = value.list;
      totalPage = value.totalPage;
      return articles;
    });
  }
}
