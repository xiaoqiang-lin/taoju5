/*
 * @Description: 线下门店
 * @Author: iamsmiling
 * @Date: 2021-04-20 17:10:50
 * @LastEditTime: 2021-04-21 10:50:30
 */
import 'package:flutter/material.dart';
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
                  return Container(
                    width: R.dimen.dp200,
                    height: R.dimen.dp158,
                    margin: EdgeInsets.only(right: R.dimen.dp10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(R.dimen.sp7),
                        border: Border.all(color: const Color(0xFFE5E5E5))),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Column(
                          children: [
                            ChimeraImage(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(R.dimen.sp7),
                                  topRight: Radius.circular(R.dimen.sp7)),
                              imageUrl:
                                  "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
                              height: R.dimen.dp90,
                              width: R.dimen.dp200,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: R.dimen.dp20),
                              child: Text(
                                "门店名称",
                                style: TextStyle(
                                    fontSize: R.dimen.sp12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: R.dimen.dp5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(R.image.starLevel),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: R.dimen.dp3,
                                      right: R.dimen.dp10,
                                    ),
                                    child: Text(
                                      "4.9分",
                                      style: TextStyle(
                                          color: R.color.ff5005,
                                          fontSize: R.dimen.sp10),
                                    ),
                                  ),
                                  Text(
                                    "累计成交单数245",
                                    style: TextStyle(
                                        color: R.color.ff00000,
                                        fontSize: R.dimen.sp10),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(R.dimen.dp44 / 2),
                          child: Image.network(
                            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F26%2F20200326190143_vRnnf.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621503756&t=4c7d0cd048ba77776bc5261dd05c036a",
                            width: R.dimen.dp44,
                            height: R.dimen.dp44,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
