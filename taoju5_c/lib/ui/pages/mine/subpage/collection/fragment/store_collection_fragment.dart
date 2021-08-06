/*
 * @Description: 门店收藏
 * @Author: iamsmiling
 * @Date: 2021-07-28 16:08:24
 * @LastEditTime: 2021-07-28 16:23:55
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';
import 'package:taoju5_c/domain/repository/collection_repository.dart';
import 'package:taoju5_c/ui/pages/store/store_list/store_list_controller.dart';
import 'package:taoju5_c/ui/pages/store/widget/physical_store_plus_card.dart';
import 'package:get/get.dart';

class StoreCollectionFragmentController
    extends PullToRefreshListViewBuilderController<StoreEntity> {
  late List<StoreEntity> stores;
  @override
  Future<List<StoreEntity>> loadData({Map? params}) {
    CollectionRepository repository = CollectionRepository();
    return repository.storeCollection().then((value) {
      stores = value.stores;
      totalPage = value.totalPage;
      return value.stores;
    });
  }
}

class StoreCollectionFragment
    extends GetView<StoreCollectionFragmentController> {
  const StoreCollectionFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureLoadStateBuilder<StoreCollectionFragmentController>(
        controller: controller,
        builder: (_) {
          return PullToRefreshListViewBuilder<StoreCollectionFragmentController,
                  StoreEntity>(
              itemBuilder: (StoreEntity item) =>
                  PhysicialStorePlusCard(store: item));
        });
  }
}
