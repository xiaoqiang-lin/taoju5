/*
 * @Description: 分类逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:45:21
 * @LastEditTime: 2021-04-19 17:51:56
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/appbar/primary_app_bar.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/ui/pages/category/categoty_controller.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (_) {
        return Scaffold(
          appBar: PrimaryAppBar(
            title: "分类",
          ),
          body: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GetBuilder<CategoryController>(
                    id: "tab",
                    builder: (_) {
                      return ListView.builder(
                          itemCount: _.categories.length,
                          itemBuilder: (BuildContext context, int i) {
                            CategoryEntity item = _.categories[i];
                            return GestureDetector(
                              onTap: () => _.onTabChanged(i),
                              child: AnimatedDefaultTextStyle(
                                  child: Text(item.name),
                                  style: item == _.currentCategory
                                      ? TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black)
                                      : TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                  duration: const Duration(milliseconds: 200)),
                            );
                          });
                    },
                  )),
              Expanded(
                  flex: 4,
                  child: PageView.builder(
                      controller: _.pageController,
                      scrollDirection: Axis.vertical,
                      itemCount: _.categories.length,
                      onPageChanged: _.onPageChanded,
                      itemBuilder: (BuildContext context, int i) {
                        CategoryEntity item = _.categories[i];
                        return Container(
                          child: Column(
                            children: [
                              Image.network(
                                item.image,
                                height: 120,
                                fit: BoxFit.fitHeight,
                              ),
                              Wrap(
                                children: [
                                  for (CategoryEntity child in item.children)
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 68,
                                          child: AspectRatio(
                                            aspectRatio: 1.0,
                                            child: Image.network(child.image),
                                          ),
                                        ),
                                        Text(child.name)
                                      ],
                                    )
                                ],
                              )
                            ],
                          ),
                        );
                      }))
            ],
          ),
        );
      },
    );
  }
}
