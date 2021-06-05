/*
 * @Description: 场景列表页面
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:24:23
 * @LastEditTime: 2021-05-29 14:10:46
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/scene/scene_category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taoju5_c/ui/pages/scene/widget/scene_card.dart';

import 'scene_list_controller.dart';

class SceneListPage extends GetView<SceneListParentController> {
  const SceneListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.category.name}"),
      ),
      body: FutureLoadStateBuilder<SceneListParentController>(
          controller: controller,
          builder: (_) {
            return Column(
              children: [
                Container(
                  width: R.dimen.width,
                  child: Stack(
                    children: [
                      TabBar(
                          isScrollable: true,
                          controller: _.tabController,
                          tabs: [
                            for (SceneCategoryEntity item in _.categoryList)
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
                  for (SceneCategoryEntity c in _.categoryList)
                    PullToRefreshStaggeredGridViewBuilder<SceneListController,
                        SceneEntity>(
                      tag: "${c.id}",
                      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                      itemBuilder: (SceneEntity item) {
                        return SceneCard(scene: item);
                      },
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.fit(2);
                      },
                      crossAxisCount: 4,
                    )
                  // PullToRefreshStaggeredGridViewBuilder<SceneListController,
                  //         SceneEntity>(
                  //     tag: "${c.id}",

                  //     staggeredGridView: StaggeredGridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)(
                  //         crossAxisCount: 2,
                  //         padding: EdgeInsets.zero,
                  //         itemBuilder: (BuildContext context, int i) {
                  //           return Text("i");
                  //         },
                  //         itemCount: 12,
                  //         mainAxisSpacing: R.dimen.dp15,
                  //         crossAxisSpacing: R.dimen.dp16,
                  //         staggeredTileBuilder: (index) {
                  //           return StaggeredTile.fit(2);
                  //         })),
                  // PullToRefreshStaggeredGridViewBuilder<SceneListController,
                  //     SceneEntity>(
                  //   tag: "${c.id}",
                  //   staggeredGridView:StaggeredGridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
                  //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   //     crossAxisCount: 2),
                  //   // itemBuilder: (SceneEntity item) {
                  //   //   return Column(
                  //   //     children: [
                  //   //       ChimeraImage(item.image),
                  //   //       Container(
                  //   //         child: Text(item.description),
                  //   //       )
                  //   //     ],
                  //   //   );
                  // )},
                  // )
                ]))
              ],
            );
          }),
    );
  }
}
