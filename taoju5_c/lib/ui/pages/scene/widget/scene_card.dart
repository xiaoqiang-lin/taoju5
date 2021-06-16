/*
 * @Description: 场景卡片
 * @Author: iamsmiling
 * @Date: 2021-05-29 14:04:48
 * @LastEditTime: 2021-05-29 14:06:26
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class SceneCard extends StatelessWidget {
  final SceneEntity scene;
  const SceneCard({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.sceneDetail + "/${scene.id}"),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
        child: Column(
          children: [
            ChimeraImage(
              scene.image,
              width: (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp15) / 2.001,
              height: (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp15) /
                  2.001 *
                  scene.aspectRatio,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp6, bottom: R.dimen.dp6),
              child: Text(
                scene.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: R.dimen.sp12,
                    color: R.color.ff333333,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(R.image.eye),
                  Text(
                    scene.label,
                    style: TextStyle(
                        fontSize: R.dimen.sp10,
                        color: R.color.ff999999,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
