/*
 * @Description: 商品列表页面 筛选 工具
 * @Author: iamsmiling
 * @Date: 2021-05-27 11:12:02
 * @LastEditTime: 2021-06-08 11:03:25
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/product/product_list_sort_params.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';

class ProductListToolBar extends StatelessWidget {
  const ProductListToolBar({Key? key}) : super(key: key);
  TextStyle get _selectedTextStyle => TextStyle(
      color: R.color.ffff5005,
      fontSize: R.dimen.sp13,
      fontWeight: FontWeight.w600);

  TextStyle get _unSelectedTextStyle => TextStyle(fontSize: R.dimen.sp13);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: R.dimen.dp24, vertical: R.dimen.dp15),
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
                        style: item.name == _.sortTye.name
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
              GestureDetector(
                  onTap: _.switchViewMode,
                  child: Image.asset(_.viewMode == PeoductViewMode.gridMode
                      ? R.image.gridMode
                      : R.image.listMode))
            ],
          ),
        );
      },
    );
  }
}
