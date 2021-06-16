/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 10:56:38
 * @LastEditTime: 2021-06-08 15:45:50
 */
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/footprint/footprint_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';

class FootPrintController
    extends PullToRefreshListViewBuilderController<FootPrintEntity> {
  MineRepository _repository = MineRepository();
  List<FootPrintEntity> footprints = [];
  @override
  Future<List<FootPrintEntity>> loadData({Map? params}) {
    return _repository.footprint().then((value) {
      footprints = value;
      return value;
    });
  }

  List<ProductEntity> get products {
    List<ProductEntity> list = [];
    footprints.forEach((e) {
      list.addAll(e.products);
    });
    return list;
  }

  List<ProductEntity> get selectedProducts =>
      products.where((e) => e.removed).toList();

  bool editing = false;

  void edit() {
    editing = !editing;

    update();
  }

  bool checkedAll = false;

  void select(ProductEntity p, bool flag) {
    p.removed = flag;
    checkedAll = products.every((e) => e.removed);

    update();
  }

  void selectAll(bool flag) {
    products.forEach((element) {
      element.removed = flag;
    });
    checkedAll = flag;

    update();
  }

  Future delete() {
    String value = products
        .where((e) => e.removed)
        .map((e) => e.browseId)
        .toList()
        .join(",");

    return _repository.removeHistory(
        params: {"type": "browse_id", "value": value}).then((value) {
      print(value);
      footprints = getRestFootprints();
    }).whenComplete(update);
  }

  List<FootPrintEntity> getRestFootprints() {
    List<FootPrintEntity> list = [];
    footprints.forEach((e) {
      if (e.products.where((e) => !e.removed).isNotEmpty) {
        e.products = e.products.where((e) => !e.removed).toList();
        list.add(e);
      }
    });
    return list;
  }
}
