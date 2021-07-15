/*
 * @Description: 文章详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 09:39:39
 * @LastEditTime: 2021-07-12 16:34:19
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/indicator/image_load_progress_indicator.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/article/article_detail_controller.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({Key? key}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleDetailController>(
      builder: (_) {
        print(_);
        return Scaffold(
          appBar: AppBar(
            title: Text("文章详情"),
            actions: [
              IconButton(
                icon: Image.asset(R.image.hasCollected),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(R.image.share),
                onPressed: () {},
              )
            ],
          ),
          body: FutureLoadStateBuilder<ArticleDetailController>(
              controller: _,
              builder: (_) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(_.article.title),
                    ),
                    SliverToBoxAdapter(
                      child: Text(_.article.image),
                    )
                  ],
                );
              }),
          // body: ListView.builder(
          //     itemCount: _.slices.length,
          //     itemBuilder: (BuildContext context, int i) {
          //       return Image.network(
          //         _.slices[i],
          //         loadingBuilder: (BuildContext context, Widget child,
          //             ImageChunkEvent? chunk) {
          //           WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          //             setState(() {});
          //           });
          //           if (chunk == null) return child;
          //           int currentLength = chunk.cumulativeBytesLoaded;
          //           int? totalLength = chunk.expectedTotalBytes;

          //           if (totalLength == null || totalLength == 0) {
          //             progress = 1;
          //           } else {
          //             progress = (currentLength / totalLength);
          //           }
          //           return Container(
          //             height: MediaQuery.of(context).size.height,
          //             width: MediaQuery.of(context).size.width,
          //             color: Colors.black,
          //             child: ImageLoadingProgressIndicator(
          //               progress: progress,
          //               size: Size.fromRadius(96),
          //             ),
          //           );
          //         },
          //       );
          //     }),
        );
      },
    );
  }
}
