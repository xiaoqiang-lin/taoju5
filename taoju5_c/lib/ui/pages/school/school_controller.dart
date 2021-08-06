/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:32:24
 * @LastEditTime: 2021-07-29 09:16:29
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/domain/repository/school_repository.dart';

class SchoolParentController
    extends BaseFutureLoadStateController<List<CategoryEntity>> {
  SchoolRepository _repository = SchoolRepository();
  List<CategoryEntity> categories = [];
  late int currentIndex = 0;
  @override
  Future<List<CategoryEntity>> loadData({Map? params}) {
    return _repository.getCategoryList(params).then((value) {
      categories = value;
      categories.forEach((e) {
        Get.lazyPut(() => SchoolController(category: e), tag: "${e.id}");
      });
      return value;
    });
  }
}

class SchoolController
    extends PullToRefreshListViewBuilderController<CourseEntity> {
  SchoolRepository _repository = SchoolRepository();
  late CategoryEntity category;
  late List<CourseEntity> courses = [];

  SchoolController({required this.category});
  @override
  Future<List<CourseEntity>> loadData({Map? params}) {
    return _repository.getCourseList({"class_id": category.id}).then((value) {
      courses = value.list;
      totalPage = value.totalPage;
      return courses;
    });
  }
}
