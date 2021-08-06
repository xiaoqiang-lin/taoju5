/*
 * @Description: 推荐页面
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:24:49
 * @LastEditTime: 2021-07-29 16:12:28
 */

import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommendationController
    extends PullToRefreshListViewBuilderController<ProductEntity> {
  CommendationController({required RefreshController controller}) {
    this.setRefreshController(controller);
  }

  Map arguments = {};
  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository
        .commendation(params: {...(params ?? {}), ...arguments}).then((value) {
      totalPage = value.totalPage;
      refreshController?.loadComplete();
      return value.products;
    });
  }
}
