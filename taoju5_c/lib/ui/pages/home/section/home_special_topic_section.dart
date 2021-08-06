/*
 * @Description:首页专题推荐
 * @Author: iamsmiling
 * @Date: 2021-04-21 11:07:29
 * @LastEditTime: 2021-07-23 17:41:21
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/home/home_topic_article_section_entity.dart';
import 'package:taoju5_c/domain/entity/school/topic_article_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/main/main_controller.dart';
import 'package:taoju5_c/ui/pages/school/school_controller.dart';

class HomeSpecialTopicSection extends StatelessWidget {
  final HomeTopicArticleSectionEntity topic;
  const HomeSpecialTopicSection({Key? key, required this.topic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp27),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${topic.title}", style: R.style.h2),
                Spacer(),
                Visibility(
                  visible: topic.more.isNotEmpty,
                  child: GestureDetector(
                    // onTap: ()=>Get.toNamed(AppRoutes.),
                    child: Row(
                      children: [
                        Text("${topic.more}", style: R.style.moreTip),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
            child: Column(
              children: [
                for (TopicArticleEntity item in topic.items)
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.articleList,
                        arguments: item, preventDuplicates: false),
                    child: Container(
                      margin: EdgeInsets.only(top: R.dimen.dp15),
                      child: ChimeraImage(
                        item.image,
                        width: R.dimen.width,
                        height: R.dimen.dp120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
