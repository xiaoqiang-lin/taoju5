/*
 * @Description: 推荐页面
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:24:49
 * @LastEditTime: 2021-06-11 18:02:58
 */

import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';

class CommendationController
    extends PullToRefreshListViewBuilderController<ProductEntity> {
  List<ProductEntity> productList = [];
  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    ProductRepository repository = ProductRepository();
    return repository.commendation().then((value) {
      productList = value;
      print(productList);
      print("______+++++++++");
      return value;
    });
  }
}
