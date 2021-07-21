/*
 * @Description: 商品列表逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:29:16
 * @LastEditTime: 2021-07-21 18:07:21
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/params/product/product_list_sort_params.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/repository/category_repository.dart';
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

abstract class AbstractProductListParentController extends GetxController {
  ///默认为网格视图
  PeoductViewMode viewMode = PeoductViewMode.gridMode;

  late CategoryEntity category;
}

class ProductListParentController
    extends BaseFutureLoadStateController<List<CategoryEntity>>
    with SingleGetTickerProviderMixin
    implements AbstractProductListParentController {
  List<CategoryEntity> _categories = [];
  PeoductViewMode viewMode = PeoductViewMode.gridMode;

  List<CategoryEntity> get categories =>
      _categories.length > 1 ? _categories : [CategoryEntity(id: -1, name: "")];

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

  CategoryEntity category =
      Get.arguments is CategoryEntity ? Get.arguments : null;

  int get _intialIndex {
    for (int i = 0; i < _categories.length; i++) {
      if (_categories[i].name == category.name) {
        return i;
      }
    }
    return 0;
  }

  setSortType(ProductListSortParamsEntity type) {
    type.isAsc = !type.isAsc;
    sortTye = type;
    update();
    refreshData();
  }

  refreshData() {
    if (!Get.isRegistered<ProductListController>(tag: currentTag)) return;
    print({
      "sort": sortTye.sort,
      "order": sortTye.order,
    });
    return Get.find<ProductListController>(tag: currentTag)
        .refreshData(params: {
      "sort": sortTye.sort,
      "order": sortTye.order,
    });
  }

  String get currentTag {
    if (categories.length > 1) {
      return "${categories[tabController.index].id}";
    }
    return "${category.id}";
  }

  switchViewMode() {
    viewMode = viewMode == PeoductViewMode.gridMode
        ? PeoductViewMode.listMode
        : PeoductViewMode.gridMode;
    update();
  }

  late TabController tabController;

  initTabBarController(List<CategoryEntity> list) {
    _categories = list;
    tabController = TabController(
        initialIndex: _intialIndex, length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<List<CategoryEntity>> loadData({Map? params}) {
    CategoryRepository repository = CategoryRepository();
    return repository.categoryList(params: {"category_id": category.id}).then(
        (List<CategoryEntity> list) {
      // data = value.products;
      initTabBarController(list);
      for (CategoryEntity c in list) {
        Get.lazyPut(() => ProductListController(c), tag: "${c.id}");
      }
      return list;
      // return value;
    }).catchError((err) {
      print(err);
      print("出现错误");
    });
  }
}

class ProductListController
    extends PullToRefreshListViewBuilderController<ProductEntity> {
  ProductRepository repository = ProductRepository();

  CategoryEntity category;

  ProductListController(this.category);

  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    Map map = {
      "category_id": category.id,
      "order_goods_id": Get.parameters["order_goods_id"],
      "is_hot": category.isHot,
      ...(params ?? {})
    };
    return repository.productList(map).then((value) {
      totalPage = value.totalPage;
      return value.products;
      // return value;
    });
  }
}
