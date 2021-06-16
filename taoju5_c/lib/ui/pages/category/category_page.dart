/*
 * @Description: 分类逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:45:21
 * @LastEditTime: 2021-06-08 11:00:16
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/category/category_skeleton.dart';
import 'package:taoju5_c/ui/pages/category/categoty_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: R.color.ffee9b5f,
        leading: Container(
          constraints: BoxConstraints(minHeight: 44),
          alignment: Alignment.center,
          child: Text(
            "分类",
            style: TextStyle(
                fontSize: R.dimen.sp18,
                fontWeight: FontWeight.w600,
                color: R.color.ffffffff),
          ),
        ),
        title: GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.search),
          child: Container(
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
                        fontSize: R.dimen.sp10, color: R.color.ffffffff),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: R.color.ffffffff.withOpacity(.3)),
          ),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              icon: Image.asset(R.image.message),
              onPressed: () {})
        ],
      ),
      body: FutureLoadStateBuilder<CategoryController>(
          controller: controller,
          loadingBuilder: (BuildContext context) => CategorySkeleton(),
          builder: (_) {
            return Row(
              children: [
                Expanded(
                    flex: 1,
                    child: GetBuilder<CategoryController>(
                      id: "tab",
                      builder: (_) {
                        return Container(
                          height: Get.height,
                          decoration:
                              BoxDecoration(color: const Color(0xFFEEEEEE)),
                          // child: Column(
                          //   children: [
                          //     for (CategoryEntity item in _.categories)
                          //       GestureDetector(
                          //         onTap: () => _
                          //             .onTabChanged(_.categories.indexOf(item)),
                          //         child: Container(
                          //           alignment: Alignment.center,
                          //           padding: EdgeInsets.symmetric(
                          //               vertical: R.dimen.dp20),
                          //           child: AnimatedDefaultTextStyle(
                          //               child: Text(item.name),
                          //               style: item == _.currentCategory
                          //                   ? TextStyle(
                          //                       fontSize: R.dimen.sp12,
                          //                       fontWeight: FontWeight.w800,
                          //                       color: R.color.ff333333)
                          //                   : TextStyle(
                          //                       color: R.color.ff333333,
                          //                       fontSize: R.dimen.sp12,
                          //                       fontWeight: FontWeight.w500),
                          //               duration:
                          //                   const Duration(milliseconds: 200)),
                          //         ),
                          //       )
                          //   ],
                          // ),
                          child: ListView.builder(
                              itemCount: _.categories.length,
                              itemBuilder: (BuildContext context, int i) {
                                CategoryEntity item = _.categories[i];
                                return GestureDetector(
                                  onTap: () => _.onTabChanged(i),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: R.dimen.dp20),
                                    child: AnimatedDefaultTextStyle(
                                        child: Text(item.name),
                                        style: item == _.currentCategory
                                            ? TextStyle(
                                                fontSize: R.dimen.sp12,
                                                fontWeight: FontWeight.w600,
                                                color: R.color.ff333333)
                                            : TextStyle(
                                                color: R.color.ff333333,
                                                fontSize: R.dimen.sp12,
                                                fontWeight: FontWeight.w500),
                                        duration:
                                            const Duration(milliseconds: 200)),
                                  ),
                                );
                              }),
                        );
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
                          double assignableWidth =
                              R.dimen.width * (4 / 5) - R.dimen.dp20 * 2;
                          double factor = 3.001;

                          return Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: R.dimen.dp20),
                                  child: ChimeraImage(
                                    item.image,
                                    width: assignableWidth,
                                    height: assignableWidth * (120 / 235),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Wrap(
                                  spacing: R.dimen.dp15,
                                  runSpacing: R.dimen.dp20,
                                  children: [
                                    for (CategoryEntity child in item.children)
                                      GestureDetector(
                                        onTap: () => Get.toNamed(
                                            AppRoutes.category +
                                                AppRoutes.productList,
                                            arguments: child),
                                        child: Container(
                                          width: (assignableWidth -
                                                  R.dimen.dp15 * 2) /
                                              factor,
                                          child: Column(
                                            children: [
                                              AspectRatio(
                                                aspectRatio: 1.0,
                                                child: Stack(
                                                  children: [
                                                    ChimeraImage(
                                                      child.image,
                                                      height: (assignableWidth -
                                                              R.dimen.dp15 *
                                                                  2) /
                                                          factor,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                    Positioned.fill(
                                                        child: Visibility(
                                                      visible: child ==
                                                          item.children.first,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "全部分类",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  R.dimen.dp10,
                                                              color: R.color
                                                                  .ffffffff,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(R
                                                                      .dimen
                                                                      .sp7),
                                                          color: R.color.ff00000
                                                              .withOpacity(.5),
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: R.dimen.dp5),
                                                child: Text(
                                                  child.name,
                                                  style: TextStyle(
                                                      fontSize: R.dimen.sp12),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            ),
                          );
                        }))
              ],
            );
          }),
    );
  }
}
