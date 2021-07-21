/*
 * @Description: 门店列表
 * @Author: iamsmiling
 * @Date: 2021-07-21 15:42:12
 * @LastEditTime: 2021-07-21 17:00:41
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';
import 'package:taoju5_c/ui/pages/store/store_list/store_list_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/store/widget/physical_store_plus_card.dart';

class StoreListPage extends GetView<StoreListParentController> {
  const StoreListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线下门店"),
      ),
      body: FutureLoadStateBuilder<StoreListParentController>(
        controller: controller,
        loadingBuilder: (_) => SizedBox.shrink(),
        builder: (_) {
          return DefaultTabController(
              length: _.categories.length,
              child: Column(
                children: [
                  TabBar(
                      tabs: _.categories
                          .map((e) => Tab(
                                child: Text(
                                  e.name,
                                ),
                              ))
                          .toList()),
                  Expanded(
                    child: TabBarView(children: [
                      for (CategoryEntity c in _.categories)
                        FutureLoadStateBuilder<StoreListController>(
                            controller:
                                Get.find<StoreListController>(tag: "${c.type}"),
                            tag: "${c.type}",
                            builder: (_) {
                              print(_);
                              return PullToRefreshListViewBuilder<
                                      StoreListController, StoreEntity>(
                                  tag: "${c.type}",
                                  itemBuilder: (StoreEntity item) =>
                                      PhysicialStorePlusCard(store: item));
                            })
                    ]),
                  )
                ],
              ));
        },
      ),
    );
  }
}
