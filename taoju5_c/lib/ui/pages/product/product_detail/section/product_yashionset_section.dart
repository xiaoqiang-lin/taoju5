/*
 * @Description: 搭配精选
 * @Author: iamsmiling
 * @Date: 2021-06-26 09:40:41
 * @LastEditTime: 2021-06-28 10:58:41
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class ProductYashionSetSection extends StatefulWidget {
  ProductYashionSetSection({Key? key}) : super(key: key);

  @override
  _ProductYashionSetSectionState createState() =>
      _ProductYashionSetSectionState();
}

class _ProductYashionSetSectionState extends State<ProductYashionSetSection> {
  int currentIndex = 0;
  late SwiperController swiperController;

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
    double itemWidth =
        (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp10 * 2) / 3.0001;
    double height = (itemWidth * (171 * (R.dimen.width / 375)) / 105);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: R.dimen.dp12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("精选搭配", style: R.style.h3),
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
                                  color: R.color.ffb4b4b4,
                                  fontSize: R.dimen.sp12),
                            ),
                            Image.asset(R.image.next, color: R.color.ffb4b4b4)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height,
                  child: Swiper(
                    loop: false,
                    onIndexChanged: onIndexChanged,
                    controller: swiperController,
                    itemBuilder: (BuildContext context, int i) {
                      return Row(
                        children: [
                          for (int i in [1, 2, 3])
                            Container(
                              width: itemWidth,
                              margin: EdgeInsets.only(
                                  right: i % 3 == 0 ? 0 : R.dimen.dp10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "https://i.loli.net/2021/04/15/dmbHyWe5DNuc1oA.png",
                                    width: itemWidth,
                                    height: itemWidth,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color:
                                            R.color.ffee9b5f.withOpacity(.08)),
                                    margin: EdgeInsets.only(
                                        left: R.dimen.dp7,
                                        top: R.dimen.dp5,
                                        bottom: R.dimen.dp3),
                                    child: Text(
                                      "材质名称",
                                      style: TextStyle(
                                          fontSize: R.dimen.sp13,
                                          color: R.color.ffee9b5f),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: R.dimen.dp4),
                                    child: Text(
                                      "BML200201",
                                      style: TextStyle(
                                          fontSize: R.dimen.sp12,
                                          color: R.color.ff333333),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: R.dimen.dp4, top: R.dimen.dp2),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(TextSpan(
                                            text: "¥",
                                            style: TextStyle(
                                                fontSize: R.dimen.sp10,
                                                color: R.color.ff333333),
                                            children: [
                                              TextSpan(
                                                  text: "359",
                                                  style: TextStyle(
                                                      fontSize: R.dimen.sp14,
                                                      color: R.color.ffff5005)),
                                              TextSpan(text: "/米")
                                            ])),
                                        Text(
                                          "￥399",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: R.dimen.sp10,
                                              color: R.color.ffb4b4b4),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                    itemCount: 5,
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
                                    borderRadius:
                                        BorderRadius.circular(R.dimen.sp3)),
                              ),
                            )),
                  ),
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
