/*
 * @Description: 门店详情
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:52:33
 * @LastEditTime: 2021-07-23 17:29:52
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/bloc/collect_button.dart';
import 'package:taoju5_c/component/button/bloc/share_button.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/store/store_detail/store_detail_controller.dart';
import 'package:get/get.dart';

class StoreDetailPage extends GetView<StoreDetailController> {
  const StoreDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreDetailController>(builder: (_) {
      return FutureLoadStateBuilder<StoreDetailController>(
          controller: _,
          loadingBuilder: (_) => SizedBox.shrink(),
          builder: (_) {
            return Scaffold(
              appBar: AppBar(
                title: Text("门店详情"),
                actions: [
                  CollectButton(
                      category: CollectionCategory.store,
                      id: _.id,
                      like: _.like),
                  ShareButton()
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: R.dimen.width * (170 / 375) + R.dimen.dp86,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            width: R.dimen.width,
                            child: AspectRatio(
                              aspectRatio: 375 / 170,
                              child: ChimeraImage(
                                _.store.image,
                                borderRadius: BorderRadius.zero,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              // transform:
                              //     Matrix4.translationValues(0, R.dimen.dp30, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ChimeraImage(
                                    _.store.avatar,
                                    width: R.dimen.dp60,
                                    height: R.dimen.dp60,
                                    borderRadius:
                                        BorderRadius.circular(R.dimen.sp30),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: R.dimen.dp12),
                                    child: Text(
                                      "${_.store.name}",
                                      style: TextStyle(
                                          fontSize: R.dimen.sp14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: R.dimen.dp8, bottom: R.dimen.dp13),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(R.image.starLevel),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: R.dimen.dp3,
                                            right: R.dimen.dp10,
                                          ),
                                          child: Text(
                                            "${_.store.score}分",
                                            style: TextStyle(
                                                color: R.color.ff5005,
                                                fontSize: R.dimen.sp10),
                                          ),
                                        ),
                                        Text(
                                          "${_.store.description}",
                                          style: TextStyle(
                                              color: R.color.ff00000,
                                              fontSize: R.dimen.sp10),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    // Transform.scale(scale: scale)

                    ,
                    Divider(
                      endIndent: R.dimen.dp20,
                      indent: R.dimen.dp20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: R.dimen.dp24, vertical: R.dimen.dp13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_.store.address}",
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    color: R.color.ff333333,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: R.dimen.dp7),
                                child: Text(
                                  "距离您${_.store.distance}",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ff999999),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                R.image.goHere,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: R.dimen.dp5),
                                child: Text(
                                  "到店",
                                  style: TextStyle(
                                      fontSize: R.dimen.sp12,
                                      color: R.color.ff333333),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: R.dimen.dp20,
                      indent: R.dimen.dp20,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: R.dimen.dp24, vertical: R.dimen.dp18),
                        child: Text.rich(TextSpan(
                            text: "联系方式：",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff333333,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: "${_.store.telephone}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal))
                            ]))),
                    Divider(
                      endIndent: R.dimen.dp20,
                      indent: R.dimen.dp20,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: R.dimen.dp24, vertical: R.dimen.dp18),
                        child: Text.rich(TextSpan(
                            text: "营业信息：",
                            style: TextStyle(
                                fontSize: R.dimen.sp12,
                                color: R.color.ff333333,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: "${_.store.bussinessHours}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal))
                            ]))),
                    Divider(
                      endIndent: R.dimen.dp20,
                      indent: R.dimen.dp20,
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
