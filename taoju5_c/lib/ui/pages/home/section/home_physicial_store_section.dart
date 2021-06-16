/*
 * @Description: 线下门店
 * @Author: iamsmiling
 * @Date: 2021-04-20 17:10:50
 * @LastEditTime: 2021-06-08 16:17:14
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/ui/pages/store/widget/physical_store_card.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';

class HomePhysicialStoreSection extends StatelessWidget {
  const HomePhysicialStoreSection({Key? key}) : super(key: key);

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
                Text("线下门店", style: R.style.h2),
                Spacer(),
                Text("更多好店", style: R.style.moreTip),
                Image.asset(R.image.next)
              ],
            ),
          ),
          Container(
            height: R.dimen.dp158,
            margin: EdgeInsets.only(left: R.dimen.dp20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  return PhysicialStoreCard();
                }),
          )
        ],
      ),
    );
  }
}
