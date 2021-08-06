/*
 * @Description: 收藏夹
 * @Author: iamsmiling
 * @Date: 2021-06-08 15:57:00
 * @LastEditTime: 2021-07-29 10:03:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/collection_controller.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/fragment/article_collection_fragment.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/fragment/scene_collection_fragment.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/fragment/store_collection_fragment.dart';

import 'fragment/product_collection_fragment.dart';

class CollectionPage extends GetView<CollectionController> {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("我的收藏"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kTextTabBarHeight),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: R.dimen.dp36),
              child: TabBar(isScrollable: true, tabs: [
                for (String label in controller.tabs)
                  Tab(
                    child: Text(label),
                  )
              ]),
            ),
          ),
        ),
        body: TabBarView(children: [
          ProductCollectionFragment(),
          StoreCollectionFragment(),
          SceneCollectionFragmment(),
          ArticleCollectionFragmment(),
        ]),
      ),
    );
  }
}
