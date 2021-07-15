/*
 * @Description: 场景推荐
 * @Author: iamsmiling
 * @Date: 2021-06-26 10:42:13
 * @LastEditTime: 2021-06-28 15:11:31
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ProductSceneDesignSection extends StatefulWidget {
  ProductSceneDesignSection({Key? key}) : super(key: key);

  @override
  _ProductSceneDesignSectionState createState() =>
      _ProductSceneDesignSectionState();
}

class _ProductSceneDesignSectionState extends State<ProductSceneDesignSection> {
  late SwiperController swiperController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    swiperController = SwiperController();
  }

  void onIndexChanged(int i) {
    setState(() {
      currentIndex = i;
    });
  }

  void jumpTo(int i) {
    setState(() {
      currentIndex = i;
      swiperController.move(i);
    });
  }

  @override
  void dispose() {
    swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: R.dimen.dp12, horizontal: R.dimen.dp20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("场景推荐", style: R.style.h3),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.category +
                      AppRoutes.productDetail +
                      "/3226" +
                      AppRoutes.productCommentList),
                  child: Row(
                    children: [
                      Text(
                        "查看更多",
                        style: TextStyle(
                            color: R.color.ffb4b4b4, fontSize: R.dimen.sp12),
                      ),
                      Image.asset(R.image.next, color: R.color.ffb4b4b4)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            // transform: Matrix4.translationValues(-R.dimen.dp20, 0, 0),
            alignment: Alignment.centerLeft,
            height: R.dimen.width * (174 + 80) / 310,
            child: Swiper(
              itemCount: 5,
              loop: false,
              layout: SwiperLayout.DEFAULT,
              containerWidth: R.dimen.width,
              controller: swiperController,
              onIndexChanged: onIndexChanged,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        // margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ChimeraImage(
                              "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png",
                              width: R.dimen.width,
                              height: R.dimen.dp174 * (R.dimen.width / 375),
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(R.dimen.sp7),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: R.dimen.dp13, left: R.dimen.dp12),
                              width: R.dimen.width,
                              height: R.dimen.dp56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(R.dimen.sp7),
                                    topRight: Radius.circular(R.dimen.sp7),
                                  ),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(.5),
                                        Colors.black.withOpacity(0)
                                      ])),
                              child: Text(
                                "北欧风",
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    color: R.color.ffffffff,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: R.dimen.width,
                        margin: EdgeInsets.only(
                          bottom: R.dimen.dp20,
                          top: R.dimen.dp10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              4,
                              (index) => Container(
                                    child: Stack(
                                      children: [
                                        Column(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width:
                                                  (R.dimen.width * (310 / 375) -
                                                          R.dimen.dp20 * 2 -
                                                          R.dimen.dp10 * 3) /
                                                      4.0001,
                                              child: AspectRatio(
                                                aspectRatio: 1.0,
                                                child: Image.network(
                                                  "https://i.loli.net/2021/04/13/4djlszXmOnRDx7N.png",
                                                ),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(
                                                  top: R.dimen.dp3),
                                              child: Opacity(
                                                opacity: index < 3 ? 1 : 0,
                                                child: Text.rich(TextSpan(
                                                    text: "¥",
                                                    style: TextStyle(
                                                        fontSize: R.dimen.sp10,
                                                        color:
                                                            R.color.ff333333),
                                                    children: [
                                                      TextSpan(
                                                          text: "359",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  R.dimen.sp14,
                                                              color: R.color
                                                                  .ffff5005)),
                                                      TextSpan(text: "/米")
                                                    ])),
                                              ),
                                            )
                                          ],
                                        ),
                                        Opacity(
                                          opacity: index < 3 ? 0 : 1,
                                          child: SizedBox(
                                            width:
                                                (R.dimen.width * (310 / 375) -
                                                        R.dimen.dp20 * 2 -
                                                        R.dimen.dp10 * 3) /
                                                    4.000,
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            R.dimen.sp7),
                                                    color: Colors.black
                                                        .withOpacity(.6)),
                                                child:
                                                    Image.asset(R.image.more),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: R.dimen.dp13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => GestureDetector(
                        onTap: () => jumpTo(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 375),
                          margin: EdgeInsets.only(right: R.dimen.dp7),
                          width: R.dimen.dp6,
                          height: R.dimen.dp6,
                          decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? R.color.ffee9b5f
                                  : R.color.ffee9b5f.withOpacity(.3),
                              borderRadius: BorderRadius.circular(R.dimen.sp3)),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
