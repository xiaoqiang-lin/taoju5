/*
 * @Description: 商品列表页
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:29:05
 * @LastEditTime: 2021-04-20 12:01:13
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_tab_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_body/product_grid_mode_skeleton.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_body/product_tab_view.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_search_bar.dart';
import 'fragment/product_list_header.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(
        autoRemove: true,
        builder: (controller) {
          return WillPopScope(
            onWillPop: controller.back,
            child: Scaffold(
              appBar: XSearchBar(
                key: ValueKey("mallPage"),
                hintText: controller.keyword,
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
                onTap: controller.search,
                readOnly: true,
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
              body: GetBuilder<ProductListParentController>(
                  id: "tabview",
                  builder: (_) {
                    return Scaffold(
                      key: controller.scaffoldKey,
                      endDrawer: ProductListFilterPage(),
                      endDrawerEnableOpenDragGesture: false,
                      body: TabBarView(
                        controller: controller.tabController,
                        children: [
                          for (ProductTabModel tab in controller.tabList)
                            GetBuilder<ProductListController>(
                              init: ProductListController(type: "${tab.id}"),
                              tag: "${tab.id}",
                              autoRemove: false,
                              builder: (_) {
                                return XLoadStateBuilder(
                                  loadState: _.loadState,
                                  retry: _.loadData,
                                  loadingWidget: ProductGridModeSkeleton(),
                                  builder: (BuildContext context) {
                                    return ProductTabView(
                                      key: ValueKey(_.productList),
                                      productList: _.productList,
                                      scrollController: _.scrollController,
                                      refreshController: _.refreshController,
                                      onLoading: _.loadMore,
                                      onRefresh: _.refreshData,
                                      enablePullDown: true,
                                      enablePullUp: true,
                                      mode: controller.mode,
                                    );
                                    // return controller.isGridMode
                                    //     ? ProductGridModeSection(
                                    //         productList: _.productList,
                                    //         scrollController: _.scrollController,
                                    //         refreshController: _.refreshController,
                                    //         onLoading: _.loadMore,
                                    //         onRefresh: _.refreshData,
                                    //         enablePullDown: true,
                                    //         enablePullUp: true,
                                    //       )
                                    //     : ProductListModeSection(
                                    //         productList: _.productList,
                                    //         scrollController: _.scrollController,
                                    //         refreshController: _.refreshController,
                                    //         onLoading: _.loadMore,
                                    //         onRefresh: _.refreshData,
                                    //         enablePullDown: true,
                                    //         enablePullUp: true,
                                    //       );
                                  },
                                );
                              },
                            )
                        ],
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
