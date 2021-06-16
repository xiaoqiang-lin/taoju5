/*
 * @Description: 首页特价专区
 * @Author: iamsmiling
 * @Date: 2021-04-21 09:44:12
 * @LastEditTime: 2021-04-21 13:27:47
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';

class HomeSpecialOfferPrefectureSection extends StatelessWidget {
  const HomeSpecialOfferPrefectureSection({Key? key}) : super(key: key);

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
                    text: "特价专区",
                    style: R.style.h2.copyWith(color: R.color.ff5005),
                    children: [
                      WidgetSpan(child: SizedBox(width: R.dimen.dp4)),
                      TextSpan(
                          text: "历史最低价速来抢购",
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
                Text("更多", style: R.style.moreTip),
                Image.asset(R.image.next)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
              child: Wrap(
                spacing: R.dimen.dp10,
                runSpacing: R.dimen.dp12,
                children: List.generate(
                    6,
                    (index) => Container(
                          width: assignableWidth / 3.001,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: ChimeraImage(
                                    "https://i.loli.net/2021/04/13/4djlszXmOnRDx7N.png"),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: R.dimen.dp3, bottom: R.dimen.dp4),
                                  child: Text(
                                    "BML200201",
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
                                            text: "345",
                                            style: TextStyle(
                                                fontSize: R.dimen.sp14,
                                                color: R.color.ff5005)),
                                        TextSpan(
                                            text: "/米",
                                            style: TextStyle(
                                                fontSize: R.dimen.sp10,
                                                color: R.color.ff333333))
                                      ])),
                                  Text(
                                    "¥399",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: R.dimen.sp10,
                                        color: R.color.ffb4b4b4),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
              ))
        ],
      ),
    );
  }
}
