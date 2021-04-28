/*
 * @Description: 商品列表逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:29:16
 * @LastEditTime: 2021-04-27 15:00:04
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/params/product/product_list_sort_params.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/res/R.dart';

enum ProductSortTye {
  ///默认排序
  defaultSort,

  ///销量排序
  saleCountSort,

  //新品优先--->时间排序
  dateSort,

  priceSort
}

extension SortTyeKit on ProductSortTye {
  String get name =>
      {
        ProductSortTye.defaultSort: "默认",
        ProductSortTye.saleCountSort: "销量优先",
        ProductSortTye.dateSort: "新品优先",
        ProductSortTye.priceSort: "价格排序",
      }[this] ??
      "";

  String getIcon({bool isDesc = false}) =>
      {
        ProductSortTye.priceSort: isDesc ? R.image.priceDesc : R.image.priceAsc,
      }[this] ??
      "";

  Map getParams({bool isAsc = false}) =>
      {
        ProductSortTye.defaultSort: {},
        ProductSortTye.saleCountSort: {"order": "sales", "sort": "desc"},
        ProductSortTye.dateSort: {"order": "is_new", "sort": "desc"},
        ProductSortTye.priceSort: {
          "order": "price",
          "sort": isAsc ? "asc" : "desc"
        },
      }[this] ??
      {};
}

enum PeoductViewMode { listMode, gridMode }

extension PeoductViewModeKit on PeoductViewMode {
  String get icon =>
      {
        PeoductViewMode.listMode: R.image.listMode,
        PeoductViewMode.gridMode: R.image.gridMode
      }[this] ??
      '';
}

class ProductListParentController extends GetxController {
  ///默认为网格视图
  PeoductViewMode viewMode = PeoductViewMode.gridMode;

  ///默认排序
  ProductListSortParamsEntity sortTye = ProductListSortParamsEntity(name: "默认");

  List<ProductListSortParamsEntity> sortTypes = [
    ProductListSortParamsEntity(name: "默认"),
    ProductListSortParamsEntity(name: "销量优先", order: "sales", sort: "desc"),
    ProductListSortParamsEntity(name: "新品优先", order: "is_new", sort: "desc"),
    ProductListSortParamsEntity(
        name: "价格排序",
        order: "is_new",
        sort: "desc",
        isAsc: false,
        showIcon: true,
        descIcon: R.image.priceDesc,
        ascIcon: R.image.priceAsc),
  ];

  ProductListParentController(this.category);

  CategoryEntity category;

  setSortType(ProductListSortParamsEntity type) {
    type.isAsc = !type.isAsc;
    sortTye = type;
    update();
    refreshData();
  }

  refreshData() {
    if (!Get.isRegistered<ProductListController>()) return;
    return Get.find<ProductListController>().loadData();
  }
}

class ProductListController
    extends BaseFutureLoadStateController<List<ProductEntity>> {
  ProductRepository repository = ProductRepository();

  CategoryEntity category;

  ProductListController(this.category);

  late List<ProductEntity> products;

  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    update();
    return repository.productList({"category_id": category.id}).then((value) {
      products = value;
      return value;
    });
  }
}
