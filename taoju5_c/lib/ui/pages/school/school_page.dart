/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:31:54
 * @LastEditTime: 2021-04-23 10:22:24
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/school/school_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth = R.dimen.width - R.dimen.dp20 * 2;
    return GetBuilder<SchoolController>(
      builder: (_) {
        return DefaultTabController(
          length: _.tabs.length,
          child: Scaffold(
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
                      fontWeight: FontWeight.bold,
                      color: R.color.ffffffff),
                ),
              ),
              title: Container(
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
              actions: [
                IconButton(
                    padding: EdgeInsets.zero,
                    icon: Image.asset(R.image.message),
                    onPressed: () {})
              ],
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: R.dimen.dp10),
                  child: TabBar(isScrollable: true, tabs: [
                    for (String item in _.tabs) Tab(child: Text(item))
                  ]),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    for (String __ in _.tabs)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                        child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 4,
                          itemCount: _.courses.length,
                          mainAxisSpacing: R.dimen.dp15,
                          crossAxisSpacing: R.dimen.dp16,
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.fit(2);
                          },
                          itemBuilder: (BuildContext context, int i) {
                            CourseEntity item = _.courses[i];
                            return GestureDetector(
                              onTap: item.isVideo
                                  ? () => Get.toNamed(AppRoutes.videoPlayer)
                                  : () => Get.toNamed(AppRoutes.articleDetail,
                                      arguments: item.type),
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        (assignableWidth - R.dimen.dp15) / 2.00,
                                    height: (assignableWidth - R.dimen.dp15) /
                                            2.00 *
                                            (item.ratio) +
                                        48,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ChimeraImage(
                                          imageUrl: _.courses[i].cover,
                                          width:
                                              (assignableWidth - R.dimen.dp15) /
                                                  2.00,
                                          height:
                                              (assignableWidth - R.dimen.dp15) /
                                                  2.00 *
                                                  (item.ratio),
                                          fit: BoxFit.fill,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: R.dimen.dp10),
                                          child: Text(
                                            item.desc,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: R.dimen.sp12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: R.dimen.dp10,
                                    right: R.dimen.dp10,
                                    child: Visibility(
                                      child: Image.asset(R.image.video),
                                      visible: item.isVideo,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
