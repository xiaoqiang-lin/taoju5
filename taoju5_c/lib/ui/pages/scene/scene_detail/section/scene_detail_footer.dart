/*
 * @Description: 场景详情底部
 * @Author: iamsmiling
 * @Date: 2021-05-29 11:14:52
 * @LastEditTime: 2021-05-29 14:16:24
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/more_scene/more_scene_section.dart';

class SceneDetailFooter extends StatelessWidget {
  const SceneDetailFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: R.dimen.dp30,
              bottom: R.dimen.dp10,
            ),
            child: Text(
              "更多场景",
              style: TextStyle(
                  fontSize: R.dimen.sp14, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(fit: FlexFit.loose, child: MoreSceneSection())
        ],
      ),
    );
  }
}
