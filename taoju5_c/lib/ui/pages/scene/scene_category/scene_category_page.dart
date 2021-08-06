/*
 * @Description: 场景分类页面
 * @Author: iamsmiling
 * @Date: 2021-05-28 10:03:19
 * @LastEditTime: 2021-07-23 09:31:38
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_category_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/scene/scene_category/scene_category_controller.dart';

class SceneCategoryPage extends GetView<SceneCategoryListParentController> {
  const SceneCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("场景搭配"),
      ),
      body: FutureLoadStateBuilder<SceneCategoryListParentController>(
          controller: controller,
          builder: (_) {
            return Column(
              children: [
                Container(
                  width: R.dimen.width,
                  child: Stack(
                    children: [
                      TabBar(controller: _.tabController, tabs: [
                        for (CategoryEntity item in _.categoryList)
                          Tab(
                            child: Text(item.name),
                          )
                      ]),
                      Positioned(
                        child: Image.asset(R.image.mask),
                        right: 0,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: _.tabController, children: [
                  for (CategoryEntity c in _.categoryList)
                    PullToRefreshGridViewBuilder<SceneCategoryListController,
                            SceneCategoryEntity>(
                        key: ObjectKey(c),
                        tag: "${c.type}",
                        autoRemove: true,
                        padding: EdgeInsets.only(top: R.dimen.dp10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (SceneCategoryEntity item) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                                Get.currentRoute + AppRoutes.sceneList,
                                arguments: c),
                            child: Column(
                              children: [
                                ChimeraImage(
                                  item.image,
                                  width: (R.dimen.width -
                                          R.dimen.dp20 * 2 -
                                          R.dimen.dp15) /
                                      2.001,
                                  height: (R.dimen.width -
                                          R.dimen.dp20 * 2 -
                                          R.dimen.dp15) /
                                      2.001 *
                                      120 /
                                      160,
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: R.dimen.dp10),
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: R.dimen.sp14,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          );
                        })
                ]))
              ],
            );
          }),
    );
  }
}
