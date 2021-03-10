/*
 * @Description: 商品排序
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:13:39
 * @LastEditTime: 2021-01-12 21:55:22
 */

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_sort_model.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';

class ProductListSorterPanel extends StatelessWidget {
  const ProductListSorterPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 240.h,
        child: GetBuilder<ProductListParentController>(
          id: "sort",
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (ProductSortModel model in _.sortList)
                  GestureDetector(
                    onTap: () => _.triggerSortAction(model),
                    child: Container(
                      height: 44.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(model.name),
                          SizedBox(
                            width: 24.w,
                          ),
                          Icon(
                            BIcons.check,
                            color: model.isChecked ? null : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
