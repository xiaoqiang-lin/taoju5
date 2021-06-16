/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 10:55:36
 * @LastEditTime: 2021-06-08 15:49:23
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/footprint/footprint_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/footprint/foot_print_controller.dart';
import 'package:taoju5_c/ui/pages/product/component/product_card.dart';

class FootPrintPage extends GetView<FootPrintController> {
  const FootPrintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FootPrintController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("我的足迹"),
          actions: [
            TextButton(
                onPressed: controller.edit,
                child: Text(
                  "${_.editing ? '完成' : '管理'}",
                  style: TextStyle(color: R.color.ff333333),
                ))
          ],
        ),
        body:
            PullToRefreshListViewBuilder<FootPrintController, FootPrintEntity>(
          itemBuilder: (FootPrintEntity item) {
            return Visibility(
              visible: item.products.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          left: R.dimen.dp24,
                          top: R.dimen.dp15,
                          bottom: R.dimen.dp8),
                      child: Text(
                        item.date,
                        style: TextStyle(
                          color: R.color.ff999999,
                          fontSize: R.dimen.sp12,
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                    child: Wrap(
                      runSpacing: R.dimen.dp16,
                      spacing: R.dimen.dp10,
                      children: [
                        for (ProductEntity p in item.products)
                          Stack(
                            children: [
                              ProductCard(
                                key: ObjectKey(p),
                                product: p,
                                width: (R.dimen.width -
                                        R.dimen.dp20 * 2 -
                                        R.dimen.dp10 * 2) /
                                    3.0001,
                                hiddenTag: _.editing,
                              ),
                              Positioned(
                                  top: R.dimen.dp5,
                                  right: R.dimen.dp5,
                                  child: Visibility(
                                    visible: _.editing,
                                    child: RoundCheckbox(
                                        key: ValueKey(p.removed),
                                        value: p.removed,
                                        onChanged: (bool f) {
                                          _.select(p, f);
                                        }),
                                  ))
                            ],
                          )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Visibility(
          visible: _.editing,
          child: Container(
            height: kBottomNavigationBarHeight + Get.mediaQuery.padding.bottom,
            padding: EdgeInsets.only(
                left: R.dimen.dp20,
                right: R.dimen.dp20,
                bottom: Get.mediaQuery.padding.bottom
                // bottom: Get.mediaQuery.padding.bottom
                ),
            decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
              BoxShadow(blurRadius: 6, color: Colors.black.withAlpha(25))
            ]),
            child: Row(
              children: [
                RoundCheckbox(
                  key: ValueKey(_.selectedProducts.length),
                  checkedIcon: Image.asset(R.image.checkedMid),
                  uncheckedIcon: Image.asset(R.image.uncheckedMid),
                  onChanged: _.selectAll,
                  value: _.checkedAll,
                ),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp8),
                  child: Text(
                    "全选",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, fontWeight: FontWeight.w500),
                  ),
                ),
                Spacer(),
                PrimaryButton(
                  text: " 删除(${controller.selectedProducts.length}) ",
                  onPressed: controller.delete,
                  mode: PrimaryButtonMode.outlinedButton,
                  padding: EdgeInsets.symmetric(
                      horizontal: R.dimen.dp24, vertical: R.dimen.dp13),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
