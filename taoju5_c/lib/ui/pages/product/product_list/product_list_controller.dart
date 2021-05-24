/*
 * @Description: 商品列表逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:29:16
 * @LastEditTime: 2021-05-19 15:05:27
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
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

class ProductListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  ///默认为网格视图
  PeoductViewMode viewMode = PeoductViewMode.gridMode;

  List<CategoryEntity> categories = [];

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

  CategoryEntity category = Get.arguments;

  int get _intialIndex {
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].name == category.name) {
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
    if (!Get.isRegistered<ProductListController>()) return;
    return Get.find<ProductListController>().loadData();
  }

  late TabController tabController;

  initTabBarController(List<CategoryEntity> list) {
    categories = list;
    tabController = TabController(
        initialIndex: _intialIndex, length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class ProductListController
    extends PullToRefreshListViewBuilderController<List<ProductEntity>> {
  ProductRepository repository = ProductRepository();

  CategoryEntity category;

  ProductListController(this.category);

  late List<ProductEntity> products = Get.arguments;

  ProductListParentController get parentController =>
      Get.find<ProductListParentController>();

  @override
  Future<List<ProductEntity>> loadData({Map? params}) {
    Map map = {"category_id": category.id};
    map.addAll(params ?? {});
    return repository.productList(map).then((value) {
      products = value.products;
      parentController.initTabBarController(value.categories);
      return products;
      // return value;
    });
  }
}
