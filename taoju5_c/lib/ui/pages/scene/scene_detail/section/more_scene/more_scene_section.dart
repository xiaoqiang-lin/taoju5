/*
 * @Description: 更多场景
 * @Author: iamsmiling
 * @Date: 2021-05-29 13:56:16
 * @LastEditTime: 2021-07-29 17:29:17
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/more_scene/more_scene_controller.dart';
import 'package:taoju5_c/ui/pages/scene/widget/scene_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

class MoreSceneSection extends StatelessWidget {
  final ScrollController scrollController;
  final String tag;
  const MoreSceneSection({
    Key? key,
    required this.scrollController,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StaggeredGridView.builder(
    //   itemCount: _.list.length,
    //   controller: _.scrollController,
    //   itemBuilder: (BuildContext context, int i) {
    //     return SceneCard(scene: _.list[i]);
    //   },
    //   gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
    //       staggeredTileBuilder: (index) {
    //         return StaggeredTile.fit(2);
    //       },
    //       crossAxisCount: 4,
    //       mainAxisSpacing: R.dimen.dp15,
    //       crossAxisSpacing: R.dimen.dp16,
    //       staggeredTileCount: _.list.length),
    // );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: GetBuilder<MoreSceneController>(
        tag: tag,
        autoRemove: false,
        builder: (_) {
          return StaggeredGridView.builder(
            itemCount: _.list.length,
            controller: scrollController,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return SceneCard(scene: _.list[i]);
            },
            gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                staggeredTileBuilder: (index) {
                  return StaggeredTile.fit(2);
                },
                crossAxisCount: 4,
                mainAxisSpacing: R.dimen.dp15,
                crossAxisSpacing: R.dimen.dp16,
                staggeredTileCount: _.list.length),
          );
        },
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: PullToRefreshStaggeredGridViewBuilder<MoreSceneController,
          SceneEntity>(
        enablePullDown: false,
        enablePullUp: true,
        // refreshController: refreshController,
        scrollController: scrollController,
        tag: tag,

        // padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
        itemBuilder: (SceneEntity item) {
          return SceneCard(scene: item);
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(2);
        },
        crossAxisCount: 4,
      ),
    );
  }
}
