/*
 * @Description: 软装专区
 * @Author: iamsmiling
 * @Date: 2021-04-20 16:54:05
 * @LastEditTime: 2021-04-21 13:22:54
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';

class HomeDecorationPrefectureSection extends StatelessWidget {
  const HomeDecorationPrefectureSection({Key? key}) : super(key: key);

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
                Text("软装专区", style: R.style.h2),
                Spacer(),
                Text("更多", style: R.style.moreTip),
                Image.asset(R.image.next)
              ],
            ),
          ),
          Container(
              height: R.dimen.dp90,
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ChimeraImage(
                                width: R.dimen.dp90,
                                height: R.dimen.dp90,
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://i.loli.net/2021/04/13/67rn3TmJ1Y4RIlu.png"),
                            Text(
                              "沙发",
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ffffffff,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ));
                  }))
        ],
      ),
    );
  }
}
