/*
 * @Description: 线下门店
 * @Author: iamsmiling
 * @Date: 2021-04-20 17:10:50
 * @LastEditTime: 2021-04-20 17:45:49
 */
import 'package:flutter/material.dart';
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
                Text("更多号店", style: R.style.moreTip),
                Image.asset(R.image.next)
              ],
            ),
          ),
          Container(
            height: R.dimen.dp158,
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
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(R.dimen.sp7),
                                  topRight: Radius.circular(R.dimen.sp7)),
                              child: Image.network(
                                "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
                                height: R.dimen.dp90,
                                width: R.dimen.dp200,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text("门店名称"),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: R.dimen.dp10),
                              child: Row(
                                children: [
                                  Text("星星"),
                                  Text("4.9分"),
                                  Text("累计成交单数245")
                                ],
                              ),
                            )
                          ],
                        ),
                        // Positioned.fill(
                        //     child: Container(
                        //   decoration: BoxDecoration(shape: BoxShape.circle),
                        //   child: Image.network(
                        //     "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F26%2F20200326190143_vRnnf.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621503756&t=4c7d0cd048ba77776bc5261dd05c036a",
                        //     width: R.dimen.dp44,
                        //     height: R.dimen.dp44,
                        //   ),
                        // ))
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
