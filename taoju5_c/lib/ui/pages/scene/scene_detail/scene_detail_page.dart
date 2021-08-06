/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-05-29 09:31:32
 * @LastEditTime: 2021-07-30 15:56:17
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/bloc/collect_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/modal/open_share_modal.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/scene_detail_controller.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/scene_detail_body.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/scene_detail_header.dart';
import 'section/more_scene/more_scene_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SceneDetailPage extends StatelessWidget {
  const SceneDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SceneDetailController>(
        tag: "${Get.parameters["id"] ?? ""}",
        autoRemove: true,
        builder: (_) {
          return FutureLoadStateBuilder<SceneDetailController>(
              controller: _,
              tag: _.id,
              builder: (_) {
                return Scaffold(
                  appBar: AppBar(
                    actions: [
                      CollectButton(
                        category: CollectionCategory.scene,
                        id: _.id,
                        like: _.scene.like,
                        key: ValueKey(_.scene.like),
                      ),
                      // IconButton(
                      //     icon: Image.asset(R.image.hasCollected), onPressed: () {}),
                      IconButton(
                          icon: Image.asset(R.image.share,
                              color: R.color.ff00000),
                          onPressed: () => openShareModal(context)),
                    ],
                  ),
                  body: SmartRefresher(
                    controller: _.refreshController,
                    enablePullDown: false,
                    enablePullUp: true,
                    // onRefresh: _.refreshData,
                    onLoading: _.loadMore,
                    scrollController: _.scrollController,
                    child: CustomScrollView(
                      controller: _.scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                            child: SceneDetailHeader(scene: _.scene)),
                        SliverToBoxAdapter(
                            child: SceneDetailBody(scene: _.scene)),
                        SliverToBoxAdapter(
                            child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: R.dimen.dp30,
                                  bottom: R.dimen.dp10,
                                ),
                                child: Text(
                                  "更多场景",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SliverToBoxAdapter(
                          child: MoreSceneSection(
                              scrollController: _.scrollController, tag: _.id),
                        )
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    decoration:
                        BoxDecoration(color: R.color.ffffffff, boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          offset: Offset(0, -1),
                          color: Colors.black.withAlpha(18))
                    ]),
                    height: kBottomNavigationBarHeight +
                        MediaQuery.of(context).padding.bottom,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                        left: R.dimen.dp20,
                        right: R.dimen.dp20),
                    margin: EdgeInsets.only(
                      top: R.dimen.dp7,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: R.dimen.dp8),
                              child: Text(
                                "预计:",
                                style: TextStyle(
                                  fontSize: R.dimen.sp12,
                                ),
                              ),
                            ),
                            Text("¥${_.scene.totalPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: R.dimen.sp15,
                                    color: R.color.ffff5005))
                          ],
                        ),
                        ProductActionBar(
                          onAddToCart: _.openModal,
                          onPurchase: _.openModal,
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
