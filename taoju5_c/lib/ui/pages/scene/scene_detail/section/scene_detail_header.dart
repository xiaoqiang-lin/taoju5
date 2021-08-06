/*
 * @Description: 场景详情头部
 * @Author: iamsmiling
 * @Date: 2021-05-29 10:18:20
 * @LastEditTime: 2021-08-03 17:16:30
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/carousel/carousel_image_slider.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class SceneDetailHeader extends StatelessWidget {
  final SceneDetailEntity scene;
  const SceneDetailHeader({Key? key, required this.scene}) : super(key: key);

  double get aspectRatio {
    double a = 1.0;
    scene.pictures.forEach((e) {
      a = min(a, e.aspectRatio);
    });
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // ChimeraImage(
      //   scene.pictures.isNotEmpty ? scene.pictures.first.cover : "",
      //   borderRadius: BorderRadius.zero,
      //   width: R.dimen.width,
      //   height: R.dimen.width /
      //       (scene.pictures.isNotEmpty ? scene.pictures.first.aspectRatio : 1),
      //   fit: BoxFit.fitWidth,
      // ),

      Container(
        // padding: EdgeInsets.only(top: R.dimen.dp10),
        child: CarouselImageSlider(
          viewportFraction: 1,
          pictures: scene.pictures,
          // height: aspectRatio,
          borderRadius: BorderRadius.zero,
          width: R.dimen.width,
          aspectRatio: aspectRatio,
        ),
      ),
      Container(
          margin: EdgeInsets.only(
            left: R.dimen.dp24,
            right: R.dimen.dp24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: R.dimen.dp15, bottom: R.dimen.dp15),
                child: Text(
                  scene.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: R.color.ff1b1b1b,
                      fontSize: R.dimen.sp14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: R.dimen.dp24),
                child: Text(
                  scene.description,
                  style: TextStyle(
                    fontSize: R.dimen.sp12,
                  ),
                ),
              ),
              Divider(),
            ],
          ))
    ]));
  }
}
