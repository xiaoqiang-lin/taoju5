/*
 * @Description: 评论列表页 详情页 朋友圈九宫格
 * @Author: iamsmiling
 * @Date: 2021-07-17 10:01:20
 * @LastEditTime: 2021-07-17 10:38:30
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:extended_image/extended_image.dart';
import 'dart:ui' as ui show Image;

class ChimeraGridImage extends StatelessWidget {
  final bool knowImageSize;
  final int index;
  final List<PictureEntity> images;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const ChimeraGridImage(
      {Key? key,
      this.knowImageSize = false,
      required this.index,
      required this.images,
      this.width,
      this.height,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double num300 = 150;
    const double num400 = 200;
    double height = num300;
    double width = num400;
    PictureEntity pic = images[index];
    final double n = 1 / pic.aspectRatio;

    return ExtendedImage.network(pic.cover,
        clearMemoryCacheWhenDispose: false, imageCacheName: "ChimeraListImage",
        loadStateChanged: (ExtendedImageState state) {
      Widget? widget;
      switch (state.extendedImageLoadState) {
        case LoadState.loading:
          widget = CupertinoActivityIndicator();
          break;
        case LoadState.completed:
          state.returnLoadStateChangedWidget = !knowImageSize;
          ui.Image uiImage = state.extendedImageInfo!.image;
          widget = Hero(
              tag: pic.cover,
              child: ExtendedRawImage(
                image: uiImage, fit: fit,
                width: width,
                height: height,
                // sourceRect: Rect.fromLTWH(
                //     0.0, 0.0, uiImage.width.toDouble(), 4 * uiImage.width / 3),
              ));
          break;
        case LoadState.failed:
          widget = GestureDetector(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset("resources/images/image_error.png",
                    fit: BoxFit.contain),
                const Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Text(
                    'load image failed, click to reload',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            onTap: () {
              state.reLoadImage();
            },
          );
          break;
      }
      widget = GestureDetector(
        child: widget,
        onTap: () {},
      );
      return widget;
    });
  }
}
