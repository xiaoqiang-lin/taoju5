/*
 * @Description: 商品搜索结果
 * @Author: iamsmiling
 * @Date: 2021-07-15 14:45:13
 * @LastEditTime: 2021-07-15 14:58:17
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';

class ProductSearchController
    extends BaseFutureLoadStateController<List<ProductEntity>> {
  ProductRepository repository = ProductRepository();

  List<ProductEntity> products = [];
  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    return repository.productList({}).then((val) {
      products = val.products;
      return products;
    });
  }
}
