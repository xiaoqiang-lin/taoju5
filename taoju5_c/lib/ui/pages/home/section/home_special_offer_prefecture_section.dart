/*
 * @Description: 首页特价专区
 * @Author: iamsmiling
 * @Date: 2021-04-21 09:44:12
 * @LastEditTime: 2021-07-21 18:04:31
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_product_special_section_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class HomeSpecialOfferPrefectureSection extends StatelessWidget {
  final HomeProductSpecialSectionEntity special;
  const HomeSpecialOfferPrefectureSection({Key? key, required this.special})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth =
        (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp10 * 2);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Row(
              children: [
                Text.rich(TextSpan(
                    text: "${special.title}",
                    style: R.style.h2.copyWith(color: R.color.ff5005),
                    children: [
                      WidgetSpan(child: SizedBox(width: R.dimen.dp4)),
                      TextSpan(
                          text: "${special.hint}",
                          style: TextStyle(
                              color: R.color.ff00000,
                              fontSize: R.dimen.sp9,
                              fontWeight: FontWeight.w600)),
                    ])),
                // Text("特价专区", style: R.style.h2.copyWith(color: R.color.ff5005)),
                // Container(
                //   margin: EdgeInsets.only(left: R.dimen.dp4),
                //   child: Text(
                //     "历史最低价速来抢购",
                //     style: TextStyle(
                //         fontSize: R.dimen.sp9, fontWeight: FontWeight.w600),
                //   ),
                // ),
                Spacer(),
                Visibility(
                  visible: special.more.isNotEmpty,
                  child: GestureDetector(
                      onTap: () => Get.toNamed(
                          AppRoutes.category + AppRoutes.productList,
                          arguments: CategoryEntity(
                              id: -1, name: "${special.title}", isHot: "1")),
                      child: Row(
                        children: [
                          Text("${special.more}", style: R.style.moreTip),
                          Image.asset(R.image.next),
                        ],
                      )),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              child: Wrap(
                spacing: R.dimen.dp10,
                runSpacing: R.dimen.dp12,
                children: special.items
                    .map((item) => GestureDetector(
                          onTap: () => Get.toNamed(
                              AppRoutes.category +
                                  AppRoutes.productDetail +
                                  "/${item.id}",
                              arguments: Get.arguments,
                              parameters:
                                  Get.parameters as Map<String, String>?),
                          child: Container(
                            width: assignableWidth / 3.001,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: ChimeraImage("${item.cover}"),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        top: R.dimen.dp3, bottom: R.dimen.dp4),
                                    child: Text(
                                      "${item.name}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: R.dimen.sp12),
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(TextSpan(
                                        text: "¥",
                                        style: TextStyle(
                                          fontSize: R.dimen.sp10,
                                        ),
                                        children: [
                                          WidgetSpan(
                                              child:
                                                  SizedBox(width: R.dimen.dp3)),
                                          TextSpan(
                                              text: "${item.price}",
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp14,
                                                  color: R.color.ff5005)),
                                          TextSpan(
                                              text: "${item.unit}",
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp10,
                                                  color: R.color.ff333333))
                                        ])),
                                    Text(
                                      "${item.marketPrice}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: R.dimen.sp10,
                                          color: R.color.ffb4b4b4),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ))
        ],
      ),
    );
  }
}
