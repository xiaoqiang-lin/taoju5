/*
 * @Description: 文章收藏
 * @Author: iamsmiling
 * @Date: 2021-07-16 15:28:19
 * @LastEditTime: 2021-07-30 06:33:38
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/domain/repository/collection_repository.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/school/widget/article_card.dart';

class ArtcleCollectionFragmentController
    extends PullToRefreshListViewBuilderController<CourseEntity> {
  List<CourseEntity> courses = [];
  @override
  Future<List<CourseEntity>> loadData({Map? params}) {
    CollectionRepository repository = CollectionRepository();

    return repository.articleCollection(params: params).then((value) {
      courses = value.list;
      totalPage = value.totalPage;
      return courses;
    });
  }
}

class ArticleCollectionFragmment
    extends GetView<ArtcleCollectionFragmentController> {
  const ArticleCollectionFragmment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: FutureLoadStateBuilder<ArtcleCollectionFragmentController>(
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
                itemCount: _.courses.length,
                controller: _.scrollController,
                itemBuilder: (BuildContext context, int i) {
                  return ArticleCard(artilce: _.courses[i]);
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
