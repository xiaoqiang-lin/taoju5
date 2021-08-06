/*
 * @Description: 场景搭配收藏
 * @Author: iamsmiling
 * @Date: 2021-07-29 09:49:30
 * @LastEditTime: 2021-07-30 06:33:00
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/domain/repository/collection_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/scene/widget/scene_card.dart';

class SceneCollectionFragmentController
    extends PullToRefreshListViewBuilderController<SceneEntity> {
  @override
  Future<List<SceneEntity>> loadData({Map? params}) {
    CollectionRepository repository = CollectionRepository();
    return repository.sceneCollection(params: params).then((value) {
      list = value.list;
      totalPage = value.totalPage;
      return list;
    });
  }
}

class SceneCollectionFragmment
    extends GetView<SceneCollectionFragmentController> {
  const SceneCollectionFragmment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: FutureLoadStateBuilder<SceneCollectionFragmentController>(
          controller: controller,
          builder: (_) {
            return SmartRefresher(
              scrollController: _.scrollController,
              controller: _.refreshController!,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _.refreshData,
              onLoading: _.loadMore,
              child: StaggeredGridView.builder(
                itemCount: _.list.length,
                controller: _.scrollController,
                itemBuilder: (BuildContext context, int i) {
                  return SceneCard(scene: _.list[i]);
                },
                gridDelegate:
                    SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.fit(2);
                        },
                        crossAxisCount: 4,
                        mainAxisSpacing: R.dimen.dp15,
                        crossAxisSpacing: R.dimen.dp16,
                        staggeredTileCount: _.list.length),
              ),
            );
          }),
    );
  }
}
