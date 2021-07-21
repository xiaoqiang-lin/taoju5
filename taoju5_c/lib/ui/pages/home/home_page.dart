/*
 * @Description: c端首页
 * @Author: iamsmiling
 * @Date: 2021-02-02 20:12:27
 * @LastEditTime: 2021-07-21 17:58:38
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:taoju5_c/ui/pages/home/section/home_custom_made_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_decoration_prefecture_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_physicial_store_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_scene_section.dart';
import 'package:taoju5_c/ui/pages/home/section/home_special_offer_prefecture_section.dart';

import 'home_controller.dart';
import 'section/home_banner_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // _goToMapView() async {
  //   return methodChannel.invokeMethod("goToMapView");
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        autoRemove: false,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              backgroundColor: R.color.ffee9b5f,
              leading: IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(R.image.location),
                onPressed: () {},
              ),
              title: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.search,
                      parameters: {"search_type": '1'}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(R.image.search),
                      Container(
                        margin: EdgeInsets.only(left: R.dimen.dp3),
                        child: Text(
                          "搜索您想找的内容",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: R.dimen.sp10, color: R.color.ffffffff),
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: R.color.ffffffff.withOpacity(.3)),
              ),
              actions: [
                IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset(R.image.message),
                    onPressed: () => Get.toNamed(AppRoutes.message))
              ],
            ),
            body: FutureLoadStateBuilder<HomeController>(
                controller: _,
                builder: (_) {
                  return SmartRefresher(
                    controller: _.refreshController,
                    enablePullDown: true,
                    enablePullUp: true,
                    onRefresh: _.refreshData,
                    onLoading: _.loadMore,
                    scrollController: _.scrollController,
                    child: CustomScrollView(
                      controller: _.scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                            child: HomeBannerSection(ads: _.home.ads)),
                        SliverToBoxAdapter(
                            child: HomeSceneSection(scene: _.home.scene)),
                        SliverToBoxAdapter(
                            child:
                                HomeCustomMadeSection(curtain: _.home.curtain)),
                        SliverToBoxAdapter(
                            child: HomeDecorationPrefectureSection(
                                soft: _.home.soft)),
                        SliverToBoxAdapter(
                            child:
                                HomePhysicialStoreSection(store: _.home.store)),
                        SliverToBoxAdapter(
                            child: HomeSpecialOfferPrefectureSection(
                                special: _.home.special)),
                        // SliverToBoxAdapter(child: HomeSpecialTopicSection()),
                        SliverToBoxAdapter(
                          child: CommendationFragment(
                            scrollController: _.scrollController,
                            tag: "home",
                            header: Container(
                              margin: EdgeInsets.only(
                                  left: R.dimen.dp24,
                                  top: R.dimen.dp24,
                                  bottom: R.dimen.dp15),
                              child: Text(
                                "精选推荐",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: R.dimen.sp15,
                                    color: R.color.ff333333),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
