/*
 * @Description: 文章详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 09:39:39
 * @LastEditTime: 2021-07-16 15:03:24
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/bloc/collect_button.dart';
import 'package:taoju5_c/component/button/bloc/share_button.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/article/article_detail_controller.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleDetailController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("文章详情"),
            actions: [
              CollectButton(
                category: CollectionCategory.article,
                id: _.id,
              ),
              ShareButton()
            ],
          ),
          body: FutureLoadStateBuilder<ArticleDetailController>(
              controller: _,
              builder: (_) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: R.dimen.dp13),
                              child: Text(
                                _.article.title,
                                style: TextStyle(
                                    fontSize: R.dimen.sp15,
                                    color: R.color.ff333333,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              _.article.date,
                              style: TextStyle(
                                  fontSize: R.dimen.sp11,
                                  color: R.color.ff666666),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ChimeraImage(_.article.image),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: R.dimen.dp20, bottom: R.dimen.dp20),
                        width: R.dimen.width,
                        alignment: Alignment.center,
                        child: Text(
                          "- END -",
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ffb4b4b4),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
