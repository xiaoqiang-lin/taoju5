/*
 * @Description:首页场景模块
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-07-26 11:24:16
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_scene_section_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class HomeSceneSection extends StatelessWidget {
  final HomeSceneSectionEntity scene;
  const HomeSceneSection({Key? key, required this.scene}) : super(key: key);

  HomeSceneEntity get first =>
      scene.items.length >= 1 ? scene.items.first : HomeSceneEntity();

  HomeSceneEntity get second =>
      scene.items.length >= 2 ? scene.items[1] : HomeSceneEntity();

  HomeSceneEntity get third =>
      scene.items.length >= 3 ? scene.items[2] : HomeSceneEntity();

  @override
  Widget build(BuildContext context) {
    double assignableWidth = Get.width - R.dimen.dp20 * 2 - R.dimen.dp10;
    double assignableHeight = assignableWidth * .6 * (190 / 185);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27, bottom: R.dimen.dp15),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${scene.title}", style: R.style.h2),
                Spacer(),
                Visibility(
                    visible: scene.more.isNotEmpty,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.sceneCategoryList),
                      child: Row(
                        children: [
                          Text("${scene.more}", style: R.style.moreTip),
                          Image.asset(R.image.next)
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: assignableHeight,
            margin: EdgeInsets.only(left: R.dimen.dp20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(
                      AppRoutes.sceneCategoryList + AppRoutes.sceneList,
                      arguments: CategoryEntity(
                          id: -1, name: first.name, type: first.type)),
                  child: Stack(
                    children: [
                      Container(
                        child: ChimeraImage(
                          first.image,
                          width: assignableWidth * .6,
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.all(R.dimen.dp12),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text("${first.name}", style: R.style.h2),
                      //       Container(
                      //           margin: EdgeInsets.only(
                      //               top: R.dimen.dp3, bottom: R.dimen.dp10),
                      //           child: Text(
                      //             "对于定制我们一丝不苟",
                      //             style: TextStyle(fontSize: R.dimen.sp12),
                      //           )),
                      //       Container(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: R.dimen.dp10,
                      //             vertical: R.dimen.dp3),
                      //         decoration: BoxDecoration(
                      //             borderRadius:
                      //                 BorderRadius.circular(R.dimen.sp12),
                      //             color: R.color.ff832f03.withOpacity(.7)),
                      //         child: Row(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text(
                      //               "我要选购",
                      //               style: TextStyle(
                      //                   color: R.color.ffffffff,
                      //                   fontSize: R.dimen.sp13),
                      //             ),
                      //             Image.asset(
                      //               R.image.next,
                      //               color: R.color.ffffffff,
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(
                      AppRoutes.sceneCategoryList + AppRoutes.sceneList,
                      arguments: CategoryEntity(
                          id: -1, name: second.name, type: second.type)),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: assignableWidth * .4,
                    margin: EdgeInsets.only(left: R.dimen.dp10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ChimeraImage(
                              second.image,
                              width: assignableWidth * .4,
                              height: (assignableHeight - R.dimen.dp10) / 2,
                              fit: BoxFit.fill,
                            ),
                            // Container(
                            //   padding: EdgeInsets.all(R.dimen.dp12),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "${second.name}",
                            //         style: TextStyle(
                            //             color: R.color.ffee7e2d,
                            //             fontSize: R.dimen.sp15,
                            //             fontWeight: FontWeight.w600),
                            //       ),
                            //       Text(
                            //         "生活需要更多点缀",
                            //         style: TextStyle(
                            //           color: R.color.ffee7e2d,
                            //           fontSize: R.dimen.sp12,
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        // Container(
                        //   width: assignableWidth * .4,
                        //   height: (assignableHeight - R.dimen.dp10) / 2,
                        //   padding: EdgeInsets.all(R.dimen.dp12),
                        //   decoration: BoxDecoration(
                        //       image: DecorationImage(
                        //           fit: BoxFit.fill,
                        //           image: NetworkImage(
                        //               "https://i.loli.net/2021/04/13/67rn3TmJ1Y4RIlu.png"))),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "空间分类",
                        //         style: TextStyle(
                        //             color: R.color.ffee7e2d,
                        //             fontSize: R.dimen.sp15,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //       Text(
                        //         "生活需要更多点缀",
                        //         style: TextStyle(
                        //           color: R.color.ffee7e2d,
                        //           fontSize: R.dimen.sp12,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        //

                        GestureDetector(
                          onTap: () => Get.toNamed(
                              AppRoutes.sceneCategoryList + AppRoutes.sceneList,
                              arguments: CategoryEntity(
                                  id: -1, name: third.name, type: third.type)),
                          child: Container(
                              width: assignableWidth * .4,
                              height: (assignableHeight - R.dimen.dp10) / 2,
                              margin: EdgeInsets.only(top: R.dimen.dp10),
                              // padding: EdgeInsets.all(R.dimen.dp12),
                              // decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //         fit: BoxFit.fill,
                              //         image: NetworkImage(
                              //             "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png"))),
                              child: Stack(
                                children: [
                                  ChimeraImage(
                                    third.image,
                                    width: assignableWidth * .4,
                                    height:
                                        (assignableHeight - R.dimen.dp10) / 2,
                                    fit: BoxFit.cover,
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.all(R.dimen.dp12),
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text(
                                  //         "${third.name}",
                                  //         style: TextStyle(
                                  //             color: R.color.ffffffff,
                                  //             fontSize: R.dimen.sp15,
                                  //             fontWeight: FontWeight.w600),
                                  //       ),
                                  //       Text(
                                  //         "用心打造家居之美",
                                  //         style: TextStyle(
                                  //             color: R.color.ffffffff,
                                  //             fontSize: R.dimen.sp12),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
