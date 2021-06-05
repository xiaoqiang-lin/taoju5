/*
 * @Description: 订单筛选面板
 * @Author: iamsmiling
 * @Date: 2021-05-25 15:42:27
 * @LastEditTime: 2021-06-04 11:24:44
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/popdown_modal/popdown_modal.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';

import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';

Future<int?> showOrderFilterModal(BuildContext ctx,
    {required List<OrderTabEntity> categories, required int currentIndex}) {
  RenderBox renderBox = ctx.findRenderObject() as RenderBox;
  Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
  double w = (R.dimen.width - R.dimen.dp25 * 2 - R.dimen.dp14 * 3) / 3.0001;
  return showModalPopdown<int?>(ctx, offset: box.bottom + 10,
      builder: (BuildContext context) {
    return GetBuilder<_OrderFilterController>(
      init: _OrderFilterController(
          categories: categories, currentIndex: currentIndex),
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: R.dimen.dp25),
          width: R.dimen.width,
          color: R.color.ffffffff,
          child: Container(
            width: R.dimen.width,
            padding: EdgeInsets.only(top: R.dimen.dp13, bottom: R.dimen.dp30),
            child: Wrap(
              spacing: R.dimen.dp14,
              alignment: WrapAlignment.start,
              children: [
                for (OrderTabEntity tab in _.categories)
                  PrimaryButton(
                    text: tab.label,
                    radius: R.dimen.sp7,
                    constraints: BoxConstraints(maxWidth: w, minWidth: w),
                    size: PrimaryButtonSize.middle,
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp9),
                    onPressed: () =>
                        Get.back(result: _.categories.indexOf(tab)),
                    mode: currentIndex != _.categories.indexOf(tab)
                        ? PrimaryButtonMode.outlinedButton
                        : PrimaryButtonMode.elevatedButton,
                  )
              ],
            ),
          ),
        );
      },
    );
  }, settings: RouteSettings());
}

class _OrderFilterController extends GetxController {
  List<OrderTabEntity> categories;
  int currentIndex;

  _OrderFilterController({required this.categories, this.currentIndex = 0});
}
