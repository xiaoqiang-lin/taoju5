/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:31:54
 * @LastEditTime: 2021-07-15 11:19:53
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/school/school_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SchoolPage extends GetView<SchoolParentController> {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth = R.dimen.width - R.dimen.dp20 * 2;
    return GetBuilder<SchoolParentController>(
      autoRemove: false,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: R.color.ffee9b5f,
            leadingWidth: 84,
            leading: Container(
              padding: EdgeInsets.only(left: R.dimen.dp20),
              constraints: BoxConstraints(minHeight: 44),
              alignment: Alignment.center,
              child: Text(
                "淘学院",
                style: TextStyle(
                    fontSize: R.dimen.sp18,
                    fontWeight: FontWeight.w600,
                    color: R.color.ffffffff),
              ),
            ),
            title: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.search,
                  parameters: {"search_type": '3'}),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: R.dimen.dp8),
                margin: EdgeInsets.only(left: R.dimen.dp18),
                alignment: Alignment.center,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: R.color.ffffffff.withOpacity(.3)),
              ),
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Image.asset(R.image.message),
                onPressed: () {},
              )
            ],
          ),
          body: FutureLoadStateBuilder<SchoolParentController>(
              controller: controller,
              builder: (_) {
                return DefaultTabController(
                  length: _.categories.length,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: R.dimen.dp10),
                        child: Stack(
                          children: [
                            TabBar(isScrollable: true, tabs: [
                              for (CategoryEntity c in _.categories)
                                Tab(child: Text(c.name))
                            ]),
                            Positioned(
                                right: 0, child: Image.asset(R.image.mask))
                          ],
                        ),
                      ),
                      Expanded(
                          child: TabBarView(
                        children: [
                          for (CategoryEntity c in _.categories)
                            GetBuilder<SchoolController>(
                                autoRemove: false,
                                tag: "${c.id}",
                                builder: (_) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: R.dimen.dp20),
                                    child: StaggeredGridView.countBuilder(
                                      padding: EdgeInsets.zero,
                                      crossAxisCount: 4,
                                      itemCount: _.courses.length,
                                      mainAxisSpacing: R.dimen.dp15,
                                      crossAxisSpacing: R.dimen.dp16,
                                      staggeredTileBuilder: (index) {
                                        return StaggeredTile.fit(2);
                                      },
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        CourseEntity item = _.courses[i];
                                        return GestureDetector(
                                          onTap: item.isVideo
                                              ? () => Get.toNamed(
                                                  AppRoutes.videoPlayer +
                                                      "/${item.id}")
                                              : () => Get.toNamed(
                                                  AppRoutes.articleDetail +
                                                      "/${item.id}",
                                                  arguments: item.type),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: (assignableWidth -
                                                        R.dimen.dp15) /
                                                    2.00,
                                                height: (assignableWidth -
                                                            R.dimen.dp15) /
                                                        2.00 *
                                                        (item.aspectRatio) +
                                                    48,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ChimeraImage(
                                                      _.courses[i].cover,
                                                      width: (assignableWidth -
                                                              R.dimen.dp15) /
                                                          2.00,
                                                      height: (assignableWidth -
                                                              R.dimen.dp15) /
                                                          2.00 *
                                                          (item.aspectRatio),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: R.dimen.dp10),
                                                      child: Text(
                                                        item.desc,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize:
                                                                R.dimen.sp12),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: R.dimen.dp10,
                                                right: R.dimen.dp10,
                                                child: Visibility(
                                                  child: Image.asset(
                                                      R.image.video),
                                                  visible: item.isVideo,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                })
                        ],
                      ))
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
