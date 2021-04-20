/*
 * @Description: 分类逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:45:21
 * @LastEditTime: 2021-04-20 17:27:23
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/appbar/primary_app_bar.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/category/categoty_controller.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: R.color.primaryColor,
            leading: Container(
              constraints: BoxConstraints(minHeight: 44),
              alignment: Alignment.center,
              child: Text(
                "分类",
                style: TextStyle(
                    fontSize: R.dimen.sp18,
                    fontWeight: FontWeight.bold,
                    color: R.color.whiteColor),
              ),
            ),
            title: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
              margin: EdgeInsets.only(left: R.dimen.dp18),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(R.image.search),
                  Container(
                    margin: EdgeInsets.only(left: R.dimen.dp3),
                    child: Text(
                      "搜索您想找的内容",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: R.dimen.sp10, color: R.color.whiteColor),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: R.color.whiteColor.withOpacity(.3)),
            ),
            actions: [
              IconButton(
                  padding: EdgeInsets.zero,
                  icon: Image.asset(R.image.message),
                  onPressed: () {})
            ],
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
