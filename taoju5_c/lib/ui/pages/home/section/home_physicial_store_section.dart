/*
 * @Description: 线下门店
 * @Author: iamsmiling
 * @Date: 2021-04-20 17:10:50
 * @LastEditTime: 2021-07-21 15:54:08
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/home/home_store_section_entity.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/store/widget/physical_store_card.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';

class HomePhysicialStoreSection extends StatelessWidget {
  final HomeStoreSectionEntity store;
  const HomePhysicialStoreSection({Key? key, required this.store})
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
                Text("${store.title}", style: R.style.h2),
                Spacer(),
                Visibility(
                    visible: store.more.isNotEmpty,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.storeList),
                      child: Row(
                        children: [
                          Text("${store.more}", style: R.style.moreTip),
                          Image.asset(R.image.next)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: R.dimen.dp158,
            margin: EdgeInsets.only(left: R.dimen.dp20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: store.items.length,
                itemBuilder: (BuildContext context, int i) {
                  return PhysicialStoreCard(store: store.items[i]);
                }),
          )
        ],
      ),
    );
  }
}
