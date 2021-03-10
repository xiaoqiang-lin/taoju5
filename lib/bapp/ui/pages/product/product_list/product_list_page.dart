/*
 * @Description: 商品列表页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:29:05
 * @LastEditTime: 2021-01-28 16:46:44
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5/bapp/domain/model/product/product_tab_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_body/product_grid_mode_skeleton.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/search/search_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_search_bar.dart';

import 'fragment/product_list_header.dart';
import 'widgets/product_card.dart';

class ProductListPage extends GetView<ProductListParentController> {
  const ProductListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XSearchBar(
        actions: [
          Visibility(
            visible: GetPlatform.isAndroid || GetPlatform.isIOS,
            child: IconButton(
                icon: Icon(
                  BIcons.scan,
                  color: BColors.greyTextColor,
                ),
                onPressed: () => Get.toNamed(BAppRoutes.scanQRCode)),
          )
        ],
        onTap: () =>
            Get.toNamed(BAppRoutes.search, arguments: SearchType.product),
        bottom: PreferredSize(
            child: Column(
              children: [
                GetBuilder<ProductListParentController>(
                  id: "tab",
                  builder: (_) {
                    return TabBar(
                      controller: controller.tabController,
                      tabs: [
                        for (ProductTabModel tab in controller.tabList)
                          Text(tab.name)
                      ],
                    );
                  },
                ),
                ProductListHeader(),
              ],
            ),
            preferredSize: Size.fromHeight(48)),
      ),
      body: Scaffold(
        key: controller.scaffoldKey,
        endDrawer: ProductListFilterPage(),
        endDrawerEnableOpenDragGesture: false,
        body: TabBarView(
          controller: controller.tabController,
          children: [
            for (ProductTabModel tab in controller.tabList)
              GetBuilder<ProductListController>(
                init: ProductListController({"category_type": tab.id}),
                tag: "${tab.id}",
                autoRemove: false,
                builder: (_) {
                  return XLoadStateBuilder(
                    loadState: _.loadState,
                    retry: _.loadData,
                    loadingWidget: ProductGridModeSkeleton(),
                    builder: (BuildContext context) {
                      return SmartRefresher(
                          scrollController: _.scrollController,
                          controller: _.refreshController,
                          onLoading: _.loadMore,
                          onRefresh: _.refreshData,
                          enablePullDown: true,
                          enablePullUp: true,
                          child: GridView.builder(
                              controller: _.scrollController,
                              itemCount: _.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.84,
                                // crossAxisSpacing: 24,
                              ),
                              itemBuilder: (BuildContext context, int i) {
                                return ProductGridCard(
                                    product: _.productList[i]);
                              }));
                    },
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
