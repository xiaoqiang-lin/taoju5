/*
 * @Description: 推荐页面
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:24:49
 * @LastEditTime: 2021-06-25 14:13:13
 */

import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommendationController
    extends PullToRefreshListViewBuilderController<ProductEntity> {
  List<ProductEntity> productList = [];

  CommendationController({required RefreshController controller}) {
    this.refreshController = controller;
  }
  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.commendation().then((value) {
      productList = value;
      return value;
    });
  }
}
