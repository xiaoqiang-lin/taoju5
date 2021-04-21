/*
 * @Description: 分类控制
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:45:21
 * @LastEditTime: 2021-04-21 11:39:53
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/repository/category_repository.dart';

class CategoryController extends GetxController {
  List<CategoryEntity> categories = [];

  late CategoryEntity currentCategory;

  late PageController pageController;

  @override
  void onInit() {
    print("((((((isBlank))))))");
    loadData();
    pageController = PageController();
    super.onInit();
  }

  Future loadData() {
    CategoryRepository repository = CategoryRepository();
    return repository.getCategoryList().then((value) {
      categories = value;
      currentCategory = categories.first;

      update();
    });
  }

  void onPageChanded(int i) {
    currentCategory = categories[i];
    update(["tab"]);
  }

  void onTabChanged(int i) {
    if (currentCategory == categories[i]) return;
    pageController.animateTo(i * Get.height,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
    currentCategory = categories[i];
    update(["tab"]);
  }
}
