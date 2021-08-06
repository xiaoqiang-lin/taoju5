// /*
//  * @Description: 自定义图片
//  * @Author: iamsmiling
//  * @Date: 2021-04-21 09:58:17
//  * @LastEditTime: 2021-05-27 17:53:29
//  */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5_c/component/image/intertaive_photo_view.dart';
// import 'package:taoju5_c/component/open_container/open_container.dart';

import 'package:flutter/cupertino.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:animations/animations.dart';

class ChimeraImage extends StatelessWidget {
  final String src;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final Duration? placeholderFadeInDuration;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final bool enlarge;
  final Widget Function(BuildContext, String)? placeHolder;
  final PictureEntity? picture;
  final bool cache;
  final int? cacheWidth;
  final int? cacheHeight;
  final FilterQuality filterQuality;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  const ChimeraImage(this.src,
      {Key? key,
      this.fadeInDuration = const Duration(milliseconds: 675),
      this.width,
      this.height,
      this.fit,
      this.borderRadius = const BorderRadius.all(Radius.circular(7)),
      this.fadeOutDuration = const Duration(milliseconds: 500),
      this.placeHolder,
      this.placeholderFadeInDuration,
      this.errorWidget,
      this.enlarge = false,
      this.picture,
      this.cache = true,
      this.cacheWidth,
      this.cacheHeight,
      this.filterQuality = FilterQuality.low,
      this.progressIndicatorBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: src,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        width: width,
        height: height,
        fit: fit,

        placeholderFadeInDuration: placeholderFadeInDuration,
        memCacheHeight: cacheHeight,
        memCacheWidth: cacheWidth,
        progressIndicatorBuilder: progressIndicatorBuilder ??
            (BuildContext context, String desc, _) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1), borderRadius: borderRadius),
              );
              // return Shimmer.fromColors(
              //   period: const Duration(milliseconds: 800),
              //   baseColor: const Color(0xFFF1F1F1),
              //   highlightColor: Colors.white,
              //   child: Container(
              //     width: width,
              //     height: height,
              //     decoration: BoxDecoration(
              //         color: const Color(0xFFF1F1F1),
              //         borderRadius: borderRadius),
              //   ),
              // );
            },

        // memCacheWidth:
        //     cacheWidth == null ? null : cacheWidth! * devicePixelRatio.round(),
        // placeholder: placeHolder ??
        //     (BuildContext context, String desc) {
        //       return Shimmer.fromColors(
        //         period: const Duration(milliseconds: 1000),
        //         baseColor: const Color(0xFFF5F5F5),
        //         highlightColor: Colors.white,
        //         child: Container(
        //           width: width,
        //           height: height,
        //           decoration: BoxDecoration(
        //               color: const Color(0xFFF5F5F5),
        //               borderRadius: borderRadius),
        //         ),
        //       );
        //     },
        errorWidget: errorWidget ??
            (BuildContext context, String desc, _) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5), borderRadius: borderRadius),
                child: Image.asset("resources/images/image_error.png",
                    fit: BoxFit.contain),
              );
            },
      ),
    );

    return enlarge
        ? Hero(tag: src, child: child)

        // OpenContainer(
        //     tappable: true,
        //     openShape: RoundedRectangleBorder(borderRadius: borderRadius!),
        //     openElevation: 0,
        //     closedElevation: 0,
        //     middleColor: Colors.transparent,
        //     clipBehavior: Clip.hardEdge,
        //     closedColor: Colors.transparent,
        //     openColor: Colors.transparent,
        //     closedShape: RoundedRectangleBorder(borderRadius: borderRadius!),
        //     openBuilder: (BuildContext context, _) {
        //       return InteractivePhotoView(
        //         pictures: [picture!],
        //       );
        //     },
        //     closedBuilder: (BuildContext context, _) {
        //       return child;
        //     })
        : child;
  }
}
