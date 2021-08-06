/*
 * @Description: 文章卡片
 * @Author: iamsmiling
 * @Date: 2021-07-29 08:37:14
 * @LastEditTime: 2021-07-29 09:47:47
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class ArticleCard extends StatelessWidget {
  final CourseEntity artilce;
  const ArticleCard({Key? key, required this.artilce}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth = R.dimen.width - R.dimen.dp20 * 2;
    return GestureDetector(
      onTap: artilce.isVideo
          ? () => Get.toNamed(AppRoutes.videoPlayer + "/${artilce.id}")
          : () => Get.toNamed(AppRoutes.articleDetail + "/${artilce.id}",
              arguments: artilce.type),
      child: Stack(
        children: [
          Container(
            width: (assignableWidth - R.dimen.dp15) / 2.00,
            height: (assignableWidth - R.dimen.dp15) /
                    2.00 *
                    (artilce.aspectRatio) +
                64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChimeraImage(
                  artilce.cover,
                  width: (assignableWidth - R.dimen.dp15) / 2.00,
                  height: (assignableWidth - R.dimen.dp15) /
                      2.00 *
                      (artilce.aspectRatio),
                  fit: BoxFit.cover,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp10, bottom: R.dimen.dp6),
                  child: Text(
                    artilce.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: R.dimen.sp12),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: R.dimen.dp6),
                      child: Image.asset(R.image.eye),
                    ),
                    Text(
                      "${artilce.description}",
                      style: TextStyle(
                          fontSize: R.dimen.sp10, color: R.color.ff999999),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: R.dimen.dp10,
            right: R.dimen.dp10,
            child: Visibility(
              child: Image.asset(R.image.video),
              visible: artilce.isVideo,
            ),
          )
        ],
      ),
    );
  }
}
