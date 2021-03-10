/*
 * @Description: 选品页面
 * @Author: iamsmiling
 * @Date: 2021-01-10 13:23:31
 * @LastEditTime: 2021-01-19 16:14:40
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_body/product_grid_mode_section.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_body/product_list_mode_section.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/fragment/product_list_filter/product_list_filter_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/search/search_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_search_bar.dart';

class SelectableProductListPage
    extends GetView<SelectableProductListController> {
  const SelectableProductListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: XSearchBar(
          onTap: () =>
              Get.toNamed(BAppRoutes.search, arguments: SearchType.product),
          // bottom: PreferredSize(
          //     child: ProductListHeader(), preferredSize: Size.fromHeight(36)),
        ),
        body: GetBuilder<ProductListController>(
            init: ProductListController({"category_type": 0}),
            tag: "窗帘",
            builder: (_) {
              return Column(children: [
                Expanded(
                    child: Scaffold(
                  // key: controller.scaffoldKey,
                  endDrawer: ProductListFilterPage(),
                  endDrawerEnableOpenDragGesture: false,
                  body: XLoadStateBuilder(
                    loadState: _.loadState,
                    builder: (BuildContext context) {
                      bool isGridMode =
                          Get.find<SelectableProductListController>()
                              .isGridMode;
                      return SizedBox.expand(
                          child: isGridMode
                              ? ProductGridModeSection(
                                  productList: _.productList)
                              : ProductListModeSection(
                                  productList: _.productList));
                    },
                  ),
                ))
              ]);
            }));
  }
}
