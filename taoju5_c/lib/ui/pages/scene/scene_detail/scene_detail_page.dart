/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-05-29 09:31:32
 * @LastEditTime: 2021-05-29 14:14:51
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/animated_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/modal/open_share_modal.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/scene_detail_controller.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/scene_detail_body.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/scene_detail_header.dart';

import 'section/scene_detail_footer.dart';

class SceneDetailPage extends GetView<SceneDetailController> {
  const SceneDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AnimatedButton(
              activeWidget: Image.asset(R.image.hasCollected),
              deactiveWidget: Image.asset(R.image.notCollect)),
          // IconButton(
          //     icon: Image.asset(R.image.hasCollected), onPressed: () {}),
          IconButton(
              icon: Image.asset(R.image.share, color: R.color.ff00000),
              onPressed: () => openShareModal(context)),
        ],
      ),
      body: FutureLoadStateBuilder<SceneDetailController>(
          controller: controller,
          builder: (_) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SceneDetailHeader(scene: _.scene)),
                SliverToBoxAdapter(child: SceneDetailBody(scene: _.scene)),
                SliverToBoxAdapter(child: SceneDetailFooter()),
              ],
            );
          }),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(
            top: R.dimen.dp7,
            bottom: MediaQuery.of(context).padding.bottom,
            left: R.dimen.dp20,
            right: R.dimen.dp20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "预计:",
                  style: TextStyle(
                    fontSize: R.dimen.sp12,
                  ),
                ),
                Text("¥${1999.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: R.dimen.sp15,
                        color: R.color.ffff5005))
              ],
            ),
            ProductActionBar(
              onAddToCart: () {},
              onPurchase: () {},
            )
          ],
        ),
      ),
    );
  }
}
