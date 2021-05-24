/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 10:55:36
 * @LastEditTime: 2021-05-19 11:30:15
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/footprint/footprint_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/footprint/foot_print_controller.dart';
import 'package:taoju5_c/ui/pages/product/component/product_card.dart';

class FootPrintPage extends GetView<FootPrintController> {
  const FootPrintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的足迹"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "管理",
                style: TextStyle(color: R.color.ff333333),
              ))
        ],
      ),
      body: FutureLoadStateBuilder(
          controller: controller,
          builder: (FootPrintController _) {
            return ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int i) {
                  FootPrintEntity item = _.footprints[0];
                  return Column(
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
                              ProductCard(
                                product: p,
                                width: (R.dimen.width -
                                        R.dimen.dp20 * 2 -
                                        R.dimen.dp10 * 2) /
                                    3.0001,
                                brandVisible: false,
                              )
                          ],
                        ),
                      )
                    ],
                  );
                });
          }),
    );
  }
}
