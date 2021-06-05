/*
 * @Description: 分类控制
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:45:21
 * @LastEditTime: 2021-06-04 11:05:47
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    pageController.animateToPage(i,
        duration: Duration(milliseconds: 375), curve: Curves.easeInOut);
    currentCategory = categories[i];
    update(["tab"]);
  }

  @override
  void onClose() {
    if (pageController.hasClients) {
      pageController.detach(pageController.position);
    }
    pageController.dispose();
    super.onClose();
  }
}
