/*
 * @Description: 文章列表页
 * @Author: iamsmiling
 * @Date: 2021-07-23 16:44:06
 * @LastEditTime: 2021-07-26 09:25:04
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/article/article_list/article_list_controller.dart';

class ArticleListPage extends GetView<ArticleListParentController> {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("专题推荐"),
      ),
      body: FutureLoadStateBuilder<ArticleListParentController>(
          controller: controller,
          builder: (_) {
            return Column(
              children: [
                ChimeraImage(
                  _.topic.image,
                  borderRadius: BorderRadius.zero,
                  height: R.dimen.dp132,
                  width: R.dimen.width,
                  fit: BoxFit.fitWidth,
                ),
                Expanded(
                  child: DefaultTabController(
                      length: _.categories.length,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: R.dimen.dp132),
                            child: TabBar(
                                isScrollable: true,
                                tabs: _.categories
                                    .map((e) => Tab(
                                          child: Text(e.name),
                                        ))
                                    .toList()),
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              for (CategoryEntity c in _.categories)
                                FutureLoadStateBuilder<ArticleListController>(
                                    controller: Get.find<ArticleListController>(
                                        tag: "${c.type}"),
                                    tag: "${c.type}",
                                    builder: (_) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(
                                          left: R.dimen.dp20,
                                          right: R.dimen.dp20,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          CourseEntity course = _.articles[i];
                                          return GestureDetector(
                                            onTap: () => Get.toNamed(
                                                AppRoutes.articleDetail +
                                                    "/${course.id}",
                                                arguments: course.type),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: R.dimen.dp15,
                                                  bottom: R.dimen.dp10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: R.dimen.dp10),
                                                    child: ChimeraImage(
                                                      course.cover,
                                                      width: R.dimen.dp104,
                                                      height: R.dimen.dp70,
                                                      fit: BoxFit.cover,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              R.dimen.sp4),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    height: R.dimen.dp70,
                                                    margin: EdgeInsets.only(
                                                        top: R.dimen.dp3,
                                                        bottom: R.dimen.dp3),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            course.title,
                                                            style: TextStyle(
                                                                fontSize: R
                                                                    .dimen.sp13,
                                                                color: R.color
                                                                    .ff333333,
                                                                height: 1.5),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            course.description,
                                                            style: TextStyle(
                                                                fontSize: R
                                                                    .dimen.sp11,
                                                                color: R.color
                                                                    .ff999999),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: _.articles.length,
                                      );
                                    })
                            ]),
                          )
                        ],
                      )),
                )
              ],
            );
          }),
    );
  }
}
