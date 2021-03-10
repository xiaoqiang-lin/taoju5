/*
 * @Description: 商品列表页面头部
 * @Author: iamsmiling
 * @Date: 2020-12-25 13:31:14
 * @LastEditTime: 2021-01-08 12:54:47
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_rotation_arrow.dart';

import '../product_list_controller.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: BDimens.gap32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder(
            builder: (_) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: BDimens.gap16),
                    child: Image.asset("assets/images/" + "grid_mode.png"),
                  ),
                  Container(
                    child: Image.asset("assets/images/" + "list_mode.png"),
                  ),
                ],
              );
            },
          ),
          GetBuilder<ProductListParentController>(
            id: "sort",
            builder: (_) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: BDimens.gap16),
                    child: XRotationArrow(
                      label: _.sortName,
                      onTap: () => _.sort(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _.filter(context),
                    child: Row(
                      children: [
                        Text("筛选"),
                        Image.asset("assets/images/" + "filter.png")
                      ],
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
