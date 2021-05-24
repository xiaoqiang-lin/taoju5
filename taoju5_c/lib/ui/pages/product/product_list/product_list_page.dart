/*
 * @Description: 商品列表页面
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:28:28
 * @LastEditTime: 2021-05-19 17:08:28
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/params/product/product_list_sort_params.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/component/product_card.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductListPage extends GetView<ProductListParentController> {
  const ProductListPage({Key? key}) : super(key: key);

  TextStyle get _selectedTextStyle => TextStyle(
      color: R.color.ffff5005,
      fontSize: R.dimen.sp13,
      fontWeight: FontWeight.bold);

  TextStyle get _unSelectedTextStyle => TextStyle(fontSize: R.dimen.sp13);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_.category.name),
            actions: [Image.asset(R.image.find)],
          ),
          body: FutureLoadStateBuilder<ProductListController>(
              controller: Get.find<ProductListController>(),
              builder: (_) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        TabBar(
                            isScrollable: true,
                            controller: controller.tabController,
                            tabs: [
                              for (CategoryEntity e in controller.categories)
                                Tab(child: Text(e.name))
                            ]),
                        Positioned(
                          child: Image.asset(R.image.mask),
                          right: 0,
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: R.dimen.dp24, vertical: R.dimen.dp15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (ProductListSortParamsEntity item
                              in controller.sortTypes)
                            GestureDetector(
                              onTap: () => controller.setSortType(item),
                              child: Row(
                                children: [
                                  Text(
                                    item.name,
                                    style: item == controller.sortTye
                                        ? _selectedTextStyle
                                        : _unSelectedTextStyle,
                                  ),
                                  Visibility(
                                      child: Image.asset(!item.isAsc
                                          ? item.ascIcon
                                          : item.descIcon),
                                      visible: item.showIcon)
                                ],
                              ),
                            ),
                          Image.asset(R.image.listMode)
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            for (CategoryEntity __ in controller.categories)
                              GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: R.dimen.dp20),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: R.dimen.dp16,
                                          crossAxisCount: 2,
                                          childAspectRatio: 160 / 236,
                                          mainAxisSpacing: R.dimen.dp16),
                                  itemCount: _.products.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return ProductCard(product: _.products[i]);
                                  })
                          ]),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
