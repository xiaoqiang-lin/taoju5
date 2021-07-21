/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-07-21 15:36:45
 * @LastEditTime: 2021-07-21 16:55:28
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';
import 'package:taoju5_c/domain/repository/store_repository.dart';

class StoreListParentController
    extends BaseFutureLoadStateController<List<CategoryEntity>> {
  late List<CategoryEntity> categories;
  @override
  Future<List<CategoryEntity>> loadData({Map? params}) {
    StoreRepository repository = StoreRepository();
    return repository.storeTabs().then((value) {
      categories = value;
      for (CategoryEntity c in categories) {
        Get.lazyPut(() => StoreListController(c), tag: "${c.type}");
      }
      return value;
    });
  }
}

class StoreListController
    extends PullToRefreshListViewBuilderController<StoreEntity> {
  late List<StoreEntity> stores;
  final CategoryEntity category;

  StoreListController(this.category);
  @override
  Future<List<StoreEntity>> loadData({Map? params}) {
    StoreRepository repository = StoreRepository();
    return repository.storeList(params: {"type": category.type}).then((value) {
      stores = value.stores;
      totalPage = value.totalPage;
      return stores;
    });
  }
}
