/*
 * @Description: 商品列表页面
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:28:28
 * @LastEditTime: 2021-07-28 12:05:36
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

import 'fragment/multiple_category_product_list_fragment.dart';
import 'fragment/single_category_product_list_fragment.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(builder: (_) {
      return Scaffold(
        ///如果来自搜索页
        appBar: _.category.id == -1
            ? AppBar(
                title: GestureDetector(
                  onTap: _.search,
                  child: Container(
                    margin: EdgeInsets.only(right: R.dimen.dp20),
                    padding: EdgeInsets.symmetric(
                        horizontal: R.dimen.dp15, vertical: R.dimen.dp8),
                    width: R.dimen.width,
                    decoration: BoxDecoration(
                        color: R.color.fff5f5f5,
                        borderRadius: BorderRadius.circular(R.dimen.sp30)),
                    child: Text(
                      _.keyword,
                      key: ValueKey(_.keyword),
                      style: TextStyle(
                          fontSize: R.dimen.sp12,
                          color: R.color.ff333333,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              )
            : AppBar(
                title: Text(_.category.name),
                actions: [Image.asset(R.image.find)],
              ),
        body: FutureLoadStateBuilder(
          controller: _,
          loadingBuilder: (BuildContext context) => SizedBox.shrink(),
          builder: (__) {
            return _.categories.length > 1
                ? MultipleCategoryProductListFragment()
                : SingleCategoryProductListFragment();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(AppRoutes.commitOrder),
          child: Image.asset(R.image.measureOrderButton),
        ),
      );
    });
  }
}
