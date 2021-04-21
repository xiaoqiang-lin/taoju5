/*
 * @Description: 自定义图片
 * @Author: iamsmiling
 * @Date: 2021-04-21 09:58:17
 * @LastEditTime: 2021-04-21 19:22:18
 */

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5_c/component/image/intertaive_photo_view.dart';
import 'package:taoju5_c/component/open_container/open_container.dart';

class ChimeraImage extends StatelessWidget {
  final String imageUrl;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final Duration? placeholderFadeInDuration;

  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final bool enlarge;
  final bool showOpenButton;
  final Widget Function(BuildContext, String)? placeHolder;
  const ChimeraImage(
      {Key? key,
      required this.imageUrl,
      this.fadeInDuration = const Duration(milliseconds: 200),
      this.width,
      this.height,
      this.fit,
      this.borderRadius = const BorderRadius.all(Radius.circular(7)),
      this.fadeOutDuration = const Duration(milliseconds: 275),
      this.placeHolder,
      this.placeholderFadeInDuration,
      this.errorWidget,
      this.enlarge = false,
      this.showOpenButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        tappable: enlarge,
        openShape: RoundedRectangleBorder(borderRadius: borderRadius!),
        openElevation: 0,
        closedElevation: 0,
        showOpenButton: showOpenButton,
        openBuilder: (BuildContext context, _) {
          return InteractivePhotoView(imageUrl: imageUrl);
        },
        closedBuilder: (BuildContext context, _) {
          return CachedNetworkImage(
            imageUrl: imageUrl,
            fadeInDuration: fadeInDuration,
            fadeOutDuration: fadeOutDuration,
            width: width,
            height: height,
            fit: fit,
            placeholderFadeInDuration: placeholderFadeInDuration,
            placeholder: placeHolder ??
                (BuildContext context, String desc) {
                  return Shimmer.fromColors(
                    period: const Duration(milliseconds: 1000),
                    baseColor: const Color(0xFFF5F5F5),
                    highlightColor: Colors.white,
                    child: Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: borderRadius),
                    ),
                  );
                },
            errorWidget: errorWidget ??
                (BuildContext context, String desc, _) {
                  return Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: borderRadius),
                    child: Image.asset("resources/images/image_error.png",
                        fit: fit),
                  );
                },
          );
        });
  }
}
