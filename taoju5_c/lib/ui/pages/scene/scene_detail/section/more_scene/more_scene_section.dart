/*
 * @Description: 更多场景
 * @Author: iamsmiling
 * @Date: 2021-05-29 13:56:16
 * @LastEditTime: 2021-05-29 14:07:53
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/more_scene/more_scene_controller.dart';
import 'package:taoju5_c/ui/pages/scene/widget/scene_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoreSceneSection extends StatelessWidget {
  const MoreSceneSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PullToRefreshStaggeredGridViewBuilder<MoreSceneController,
        SceneEntity>(
      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      itemBuilder: (SceneEntity item) {
        return SceneCard(scene: item);
      },
      staggeredTileBuilder: (index) {
        return StaggeredTile.fit(2);
      },
      crossAxisCount: 4,
    );
  }
}
