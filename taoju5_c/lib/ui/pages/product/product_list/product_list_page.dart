/*
 * @Description: 商品列表页面
 * @Author: iamsmiling
 * @Date: 2021-04-23 17:28:28
 * @LastEditTime: 2021-04-27 13:36:30
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/params/product/product_list_sort_params.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductListPage extends StatelessWidget {
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
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (ProductListSortParamsEntity item in _.sortTypes)
                      GestureDetector(
                        onTap: () => _.setSortType(item),
                        child: Row(
                          children: [
                            Text(
                              item.name,
                              style: item == _.sortTye
                                  ? _selectedTextStyle
                                  : _unSelectedTextStyle,
                            ),
                            Visibility(
                                child: Image.asset(
                                    !item.isAsc ? item.ascIcon : item.descIcon),
                                visible: item.showIcon)
                          ],
                        ),
                      ),
                    Image.asset(R.image.listMode)
                  ],
                ),
              ),
              Expanded(
                  child: FutureLoadStateBuilder<ProductListController>(
                      controller: Get.find<ProductListController>(),
                      builder: (_) {
                        return GridView.builder(
                            padding:
                                EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: R.dimen.dp16,
                                    crossAxisCount: 2,
                                    childAspectRatio: 4 / 5,
                                    mainAxisSpacing: R.dimen.dp16),
                            itemCount: _.products.length,
                            itemBuilder: (BuildContext context, int i) {
                              ProductEntity item = _.products[i];
                              return GestureDetector(
                                onTap: () => Get.toNamed(AppRoutes.category +
                                    AppRoutes.productDetail +
                                    "/${item.id}"),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(item.cover),
                                      Text(item.name),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }))
            ],
          ),
        );
      },
    );
  }
}
