/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:35:04
 * @LastEditTime: 2021-01-28 10:16:39
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_sort_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_tab_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_sorter/product_list_sorter_panel.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:taoju5/bapp/ui/widgets/common/modal/x_popdown_modal.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ProductListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  ProductRepository _repository = ProductRepository();
  List<ProductTabModel> tabList = [
    ProductTabModel(name: "窗帘", id: 0, isChecked: true),
    ProductTabModel(name: "床品", id: 1),
    ProductTabModel(name: "抱枕", id: 2),
    ProductTabModel(name: "沙发", id: 3),
    ProductTabModel(name: "搭毯", id: 4),
  ];
  List<ProductSortModel> sortList = [
    ProductSortModel(id: 1, name: "默认排序", isChecked: true),
    ProductSortModel(id: 2, name: "新品优先", order: "is_new", sort: "desc"),
    ProductSortModel(id: 3, name: "销量排序", order: "sales", sort: "desc"),
    ProductSortModel(id: 4, name: "价格升序", order: "price", sort: "asc"),
    ProductSortModel(id: 5, name: "价格降序", order: "price", sort: "desc"),
  ];

  String get sortName => sortList.firstWhere((e) => e.isChecked).name;

  ///是否为网格视图
  bool isGridMode = true;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;

  Future loadData() {
    return _repository.categoryList().then((BaseResponse response) {
      if (response.isValid) {
        List list = response.data;
        List<ProductTabModel> _tabList = [];
        for (int i = 0; i < list.length; i++) {
          _tabList.add(ProductTabModel(name: list[i], id: i));
        }
        tabList = _tabList;
        update(["tab"]);
      }
    });
  }

  void _onTabChanged() {
    tabList.forEach((element) {
      element.isChecked = element.id == tabController.index;
    });
    closePanel();
    if (Get.isRegistered<ProductListFilterController>()) {
      Get.find<ProductListFilterController>()
          .loadData(params: {"category_type": currentTabModel.id});
    }
    // openFilterDrawer(Get.context);
  }

  void closePanel() {
    if (scaffoldKey.currentState.isEndDrawerOpen) {
      Get.back();
    }
  }

  ProductTabModel get currentTabModel =>
      tabList?.firstWhere((e) => e?.isChecked, orElse: () => tabList?.first);

  @override
  void onInit() {
    tabController = TabController(length: tabList.length, vsync: this)
      ..addListener(_onTabChanged);
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    tabController?.removeListener(_onTabChanged);
    tabController?.dispose();
    super.onClose();
  }

  void triggerSortAction(ProductSortModel model) {
    for (ProductSortModel e in sortList) {
      e.isChecked = e == model;
    }
    update(["sort"]);
    Get.back();
    Map map = {};
    map.addAll(model.params);
    map.addAll({"category_type": currentTabModel.id});
    productListController.refreshData(params: map);
  }

  Future openSortPanel(BuildContext ctx) {
    ///判断是否已经打开了排序面板,如果已经打开,则关闭
    if (!ModalRoute.of(ctx).isCurrent) {
      Get.back();
      return Future.value(false);
    }

    ///判断是否已经打开筛选面板,如果已经打开则关闭
    if (scaffoldKey?.currentState?.isEndDrawerOpen == true) {
      Get.back();
    }

    ///打开排序面板
    RenderBox renderBox = ctx.findRenderObject();
    Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
    return showXModalPopdown(ctx,
            builder: (BuildContext context) => ProductListSorterPanel(),
            offset: box.bottom)
        .then((value) {
      // refreshData();
    });
  }

  String get tag => "${tabList[tabController?.index ?? 0]?.id}";

  ProductListController get productListController {
    if (!Get.isRegistered<ProductListController>(tag: tag)) {
      return null;
    }

    return Get.find<ProductListController>(tag: tag);
  }

  void openFilterDrawer(BuildContext context) {
    ///如果已经打开了排序面版 则关闭排序面板
    if (!ModalRoute.of(context).isCurrent) {
      Get.back();
    }

    // print("啦啦啦啦啦啦");
    // print(scaffoldKey.currentState);
    //如果已经打开了筛选面板
    if (scaffoldKey?.currentState?.isEndDrawerOpen == true) {
      Get.back();
    } else {
      scaffoldKey?.currentState?.openEndDrawer();
    }
  }
}

class ProductListController extends GetxController {
  ProductRepository _repository = ProductRepository();

  List<ProductModel> productList = [];
  //[_scaffoldKey]控制右侧筛选面板的打开与关闭

  XLoadState loadState = XLoadState.idle;

  RefreshController refreshController;

  ScrollController scrollController;

  final String type;

  int pageIndex = 1;

  ProductListController({@required this.type});

  Map get args => {"category_type": type, "page_index": pageIndex};

  Future loadData({Map params}) {
    loadState = XLoadState.busy;

    return _repository
        .productList(params: params)
        .then((ProductModelListWrapper wrapper) {
      productList = wrapper.list;
      if (GetUtils.isNullOrBlank(productList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future loadMore() {
    pageIndex += 1;

    return _repository
        .productList(params: args)
        .then((ProductModelListWrapper wrapper) {
      loadState = XLoadState.idle;
      productList.addAll(wrapper.list);
      if (GetUtils.isNullOrBlank(wrapper.list)) {
        refreshController?.loadNoData();
      } else {
        refreshController.loadComplete();
      }
    }).catchError((err) {
      loadState = XLoadState.error;
      refreshController.loadFailed();
    }).whenComplete(update);
  }

  Future refreshData({Map params}) {
    pageIndex = 1;
    args.addAll(params ?? {});
    loadState = XLoadState.busy;
    update();
    return _repository
        .productList(params: args)
        .then((ProductModelListWrapper wrapper) {
      refreshController.refreshCompleted();
      productList = wrapper.list;
      if (GetUtils.isNullOrBlank(productList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      refreshController.refreshFailed();
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData(params: args);
    refreshController = RefreshController();
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    scrollController?.dispose();
    super.onClose();
  }
}
