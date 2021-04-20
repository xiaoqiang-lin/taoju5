/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:35:04
 * @LastEditTime: 2021-04-20 11:27:18
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_b/domain/model/order/order_detail_model.dart';
import 'package:taoju5_b/domain/model/order/order_detail_product_model.dart';
import 'package:taoju5_b/domain/model/product/product_model.dart';
import 'package:taoju5_b/domain/model/product/product_sort_model.dart';
import 'package:taoju5_b/domain/model/product/product_tab_model.dart';
import 'package:taoju5_b/domain/repository/product/product_repository.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/product/product_list/fragment/product_list_body/product_tab_view.dart';
import 'package:taoju5_b/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_list/fragment/product_list_sorter/product_list_sorter_panel.dart';
import 'package:taoju5_b/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';
import 'package:taoju5_b/ui/pages/search/search_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';
import 'package:taoju5_b/ui/widgets/common/modal/x_popdown_modal.dart';
import 'package:taoju5_b/xdio/x_dio.dart';

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

  String keyword;

  ///是否为网格视图

  bool isGridMode = true;

  ProductViewMode get mode =>
      isGridMode ? ProductViewMode.grid : ProductViewMode.list;

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

  Future<bool> back() {
    if (GetUtils.hasMatch(Get.previousRoute, BAppRoutes.commitOrderSuccess)) {
      Get.until((route) => Get.currentRoute == BAppRoutes.home);
    } else {
      Get.back();
    }
    return Future.value(true);
  }

  void switchViewMode() {
    isGridMode = !isGridMode;
    update(["tab", "tabview"]);
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
    keyword = null;
    _onClose();
    super.onClose();
  }

  void _onClose() {
    for (ProductTabModel tab in tabList) {
      Get.delete<ProductListController>(tag: "${tab.id}", force: true);
    }
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
    productListController.refreshData(parameters: map);
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
            offset: box.bottom,
            settings: RouteSettings(arguments: Get.arguments))
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

  Future seacrhProduct(String keyword) {
    if (GetUtils.isNullOrBlank(keyword)) return Future.value(null);
    this.keyword = keyword;
    update();
    return _repository.productList(params: {"keyword": keyword}).then(
        (ProductModelListWrapper wrapper) {
      List<ProductModel> productList = wrapper.list;
      if (GetUtils.isNull(productList)) return;

      int targetIndex = wrapper?.targetCategoryType;
      Get.find<ProductListController>(tag: tag).refreshData(keyword: keyword);
      // productListController.refreshData(keyword: keyword);
      if (tabController.index != targetIndex) {
        tabController.animateTo(targetIndex);
        productListController.refreshData(keyword: keyword);
      }
    }).whenComplete(() {
      update(["tabview"]);
    });
  }

  Future search() {
    return Get.toNamed(BAppRoutes.search +
            "?searchType=${SearchType.product.index}&keyword=$keyword")
        .then((value) {
      return value;
    }).then((value) {
      seacrhProduct(value);
    });
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
  String get keyword => Get.find<ProductListParentController>().keyword;

  ProductListController({@required this.type});

  Map refreshParams = {};

  Map get args {
    Map map = {
      "category_type": type,
      "page_index": pageIndex,
      "keyword": keyword,
    };
    map.addAll(refreshParams);
    if (Get.arguments != null && Get.arguments is SelectProductEvent) {
      SelectProductEvent event = Get.arguments;
      OrderDetailProductModel orderProduct = event.orderProduct;
      OrderMeasureDataModel measureData = orderProduct.measureData;
      map.addAll(
          {"order_goods_id": orderProduct.id, "height": measureData.height});
    }
    // String keyword = Get.parameters["keyword"];
    // if (!GetUtils.isNullOrBlank(keyword)) {
    //   map.addAll({"keyword": keyword});
    // }
    return map;
  }

  Future loadData({Map params}) {
    loadState = XLoadState.busy;

    return _repository
        .productList(params: params)
        .then((ProductModelListWrapper wrapper) {
      this.productList = wrapper.list;
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

  Future refreshData({Map parameters, String keyword}) {
    pageIndex = 1;
    Map map = {};
    refreshParams.addAll(parameters ?? {});
    map.addAll(args);
    map.addAll(parameters ?? {});
    map.addAll({"keyword": keyword});
    loadState = XLoadState.busy;
    update();
    return _repository
        .productList(params: map)
        .then((ProductModelListWrapper wrapper) {
      refreshController.refreshCompleted();
      this.productList = wrapper.list;
      if (GetUtils.isNullOrBlank(productList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
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
