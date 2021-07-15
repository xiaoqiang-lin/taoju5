/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:32:24
 * @LastEditTime: 2021-07-12 15:51:50
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/domain/repository/school_repository.dart';

class SchoolParentController
    extends BaseFutureLoadStateController<List<CategoryEntity>> {
  SchoolRepository _repository = SchoolRepository();
  List<CategoryEntity> categories = [];
  List<String> tabs = ["推荐", "配色方案", "必买清单", "居家经验", "专题文章", "精选视频", "家具"];

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
    extends BaseFutureLoadStateController<List<CourseEntity>> {
  SchoolRepository _repository = SchoolRepository();
  late CategoryEntity category;
  late List<CourseEntity> courses = [];

  SchoolController({required this.category});
  @override
  Future<List<CourseEntity>> loadData({Map? params}) {
    return _repository.getCourseList({"class_id": category.id}).then((value) {
      courses = value;
      return value;
    });
  }
}
