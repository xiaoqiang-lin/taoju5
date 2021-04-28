/*
 * @Description: 分类控制
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:45:21
 * @LastEditTime: 2021-04-28 10:06:37
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/repository/category_repository.dart';

class CategoryController
    extends BaseFutureLoadStateController<List<CategoryEntity>> {
  List<CategoryEntity> categories = [];

  late CategoryEntity currentCategory;

  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  Future<List<CategoryEntity>> loadData({Map? params}) {
    CategoryRepository repository = CategoryRepository();
    return repository.getCategoryList().then((value) {
      categories = value;
      currentCategory = categories.first;
      return value;
    });
  }

  void onPageChanded(int i) {
    currentCategory = categories[i];
    update(["tab"]);
  }

  void onTabChanged(int i) {
    if (currentCategory == categories[i]) return;
    pageController.animateTo(
        i * Get.height - kBottomNavigationBarHeight - kToolbarHeight * 2,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease);
    currentCategory = categories[i];
    update(["tab"]);
  }
}
