/*
 * @Description:  推荐页面
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:23:58
 * @LastEditTime: 2021-06-11 18:04:23
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CommendationFragment extends StatelessWidget {
  final String title;
  const CommendationFragment({Key? key, this.title = "为你推荐"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: R.dimen.sp15,
                  fontWeight: FontWeight.w600,
                  color: R.color.ff333333),
            ),
          ),
          Flexible(child: GetBuilder<CommendationController>(builder: (_) {
            return PullToRefreshStaggeredGridViewBuilder<CommendationController,
                ProductEntity>(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              itemBuilder: (ProductEntity item) {
                print(item.name);
                return Text(item.name);
                // return SceneCard(scene: item);
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.fit(2);
              },
              crossAxisCount: 4,
            );
          }))
        ],
      ),
    );
  }
}
