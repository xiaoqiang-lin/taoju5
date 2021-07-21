/*
 * @Description: 软装专区
 * @Author: iamsmiling
 * @Date: 2021-04-20 16:54:05
 * @LastEditTime: 2021-07-21 12:00:56
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_soft_decoration_section_entity.dart';
import 'package:taoju5_c/res/R.dart';

import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/soft_decoration/widget/soft_decoration_card.dart';

class HomeDecorationPrefectureSection extends StatelessWidget {
  final HomeSoftDecorationSectionEntity soft;
  const HomeDecorationPrefectureSection({Key? key, required this.soft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Row(
              children: [
                Text("${soft.title}", style: R.style.h2),
                Spacer(),
                Visibility(
                    visible: soft.more.isNotEmpty,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.softDecorationList,
                          arguments: soft.items),
                      child: Row(
                        children: [
                          Text("${soft.more}", style: R.style.moreTip),
                          Image.asset(R.image.next)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
              height: R.dimen.dp90,
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: soft.items.length,
                  itemBuilder: (BuildContext context, int i) =>
                      SoftDecorationCard(soft: soft.items[i])))
        ],
      ),
    );
  }
}
