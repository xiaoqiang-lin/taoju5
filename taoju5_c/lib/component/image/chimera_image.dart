// /*
//  * @Description: 自定义图片
//  * @Author: iamsmiling
//  * @Date: 2021-04-21 09:58:17
//  * @LastEditTime: 2021-05-27 17:53:29
//  */

// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:extended_image/extended_image.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// class ChimeraImage extends StatefulWidget {
//   final String src;
//   final Duration fadeInDuration;
//   final Duration fadeOutDuration;
//   final Duration? placeholderFadeInDuration;
//   final double? width;
//   final double? height;
//   final BoxFit? fit;
//   final BorderRadius? borderRadius;
//   final Widget Function(BuildContext, String, dynamic)? errorBuilder;
//   final bool enlarge;
//   final Widget Function(BuildContext, String)? placeHolder;
//   final bool slidable;
//   final List<String> images;
//   final int initialIndex;
//   final bool cache;
//   final String? heroTag;

//   ///是否需要动画
//   final bool animated;
//   final Widget? magnifier;
//   final double magnifierMarginTop;
//   final double magnifierMarginRight;
//   const ChimeraImage(
//     this.src, {
//     Key? key,
//     this.fadeInDuration = const Duration(milliseconds: 200),
//     this.width,
//     this.height,
//     this.fit = BoxFit.contain,
//     this.borderRadius = const BorderRadius.all(Radius.circular(7)),
//     this.fadeOutDuration = const Duration(milliseconds: 275),
//     this.placeHolder,
//     this.placeholderFadeInDuration,
//     this.errorBuilder,
//     this.enlarge = false,
//     this.slidable = false,
//     this.images = const [],
//     this.initialIndex = 0,
//     this.animated = true,
//     this.magnifier,
//     this.cache = false,
//     this.heroTag,
//     this.magnifierMarginTop = 0,
//     this.magnifierMarginRight = 0,
//   }) : super(key: key);

//   @override
//   _ChimeraImageState createState() => _ChimeraImageState();
// }

// class _ChimeraImageState extends State<ChimeraImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     _controller = AnimationController(
//         vsync: this,
//         duration: const Duration(milliseconds: 375),
//         lowerBound: 0.0,
//         upperBound: 1.0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // return widget.slidable
//   //     ? ImageViewGallery(
//   //         images: widget.images,
//   //         currentIndex: widget.currentIndex,
//   //       )
//   //     : InteractivePhotoView(src: widget.src);
//   // if (slidable) {
//   //   return ImageViewGallery(
//   //     images: images,
//   //     currentIndex: currentIndex,
//   //   );
//   // }
//   // return InteractivePhotoView(src: src);
//   // }));

//   open(BuildContext context, int i) {
//     List<String> imgs = [];
//     if (widget.images.isEmpty) {
//       imgs.add(widget.src);
//     } else {
//       imgs = widget.images;
//     }
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             fullscreenDialog: true,
//             builder: (BuildContext context) => _GalleryPreviewPage(
//                   images: imgs,
//                   backgroundDecoration: const BoxDecoration(
//                     color: Colors.black,
//                   ),
//                   initialIndex: 0,
//                   scrollDirection: Axis.horizontal,
//                 )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget child = ClipRRect(
//       borderRadius: widget.borderRadius,
//       child: ExtendedImage.network(
//         widget.src,
//         borderRadius: widget.borderRadius,
//         cache: widget.cache,
//         width: widget.width,
//         height: widget.height,
//         cacheRawData: false,
//         fit: widget.fit,
//         initGestureConfigHandler: (ExtendedImageState state) {
//           return GestureConfig(
//             minScale: 0.9,
//             animationMinScale: 0.7,
//             maxScale: 4.0,
//             animationMaxScale: 4.5,
//             speed: 1.0,
//             inertialSpeed: 100.0,
//             initialScale: 1.0,
//             inPageView: false,
//             initialAlignment: InitialAlignment.center,
//             gestureDetailsIsChanged: (GestureDetails? details) {
//               //print(details?.totalScale);
//             },
//           );
//         },
//         loadStateChanged: (ExtendedImageState state) {
//           switch (state.extendedImageLoadState) {
//             case LoadState.loading:
//               _controller.reset();
//               return Shimmer.fromColors(
//                 period: const Duration(milliseconds: 1000),
//                 baseColor: const Color(0xFFF5F5F5),
//                 highlightColor: Colors.white,
//                 child: Container(
//                   width: widget.width,
//                   height: widget.height,
//                   decoration: BoxDecoration(
//                       color: const Color(0xFFF5F5F5),
//                       borderRadius: widget.borderRadius),
//                 ),
//               );
//             case LoadState.completed:
//               _controller.forward();

//               ///if you don't want override completed widget
//               ///please return null or state.completedWidget
//               //return null;
//               //return state.completedWidget;

//               return FadeTransition(
//                 opacity: _controller,
//                 child: ExtendedRawImage(
//                   image: state.extendedImageInfo?.image,
//                   width: widget.width,
//                   height: widget.height,
//                   fit: widget.fit,
//                 ),
//               );
//             case LoadState.failed:
//               _controller.reset();
//               //remove memory cached
//               state.imageProvider.evict();
//               return Image.asset(
//                 "resources/images/image_error.png",
//                 width: widget.width,
//                 height: widget.height,
//                 fit: BoxFit.contain,
//               );
//           }
//         },
//       ),
//     );
//     if (!widget.animated) {
//       child = Image.network(
//         widget.src,
//         width: widget.width,
//         height: widget.height,
//         fit: widget.fit,
//       );
//     }
//     if (widget.enlarge) {
//       assert(widget.heroTag != null, "enlarge为真时 heroTag不能为空");
//       if (widget.magnifier != null) {
//         child = Stack(
//           children: [
//             Hero(tag: widget.heroTag!, child: child),
//             widget.magnifier == null
//                 ? SizedBox.shrink()
//                 : Positioned(
//                     child: GestureDetector(
//                       onTap: () => open(
//                           context,
//                           widget.images.isEmpty
//                               ? widget.images.indexOf(widget.src)
//                               : 0),
//                       child: widget.magnifier!,
//                     ),
//                     top: widget.magnifierMarginTop,
//                     right: widget.magnifierMarginRight,
//                   )
//           ],
//         );
//       } else {
//         child = GestureDetector(
//           onTap: () => open(context,
//               widget.images.isEmpty ? widget.images.indexOf(widget.src) : 0),
//           child: Hero(
//             tag: widget.src,
//             child: child,
//           ),
//         );
//       }
//     }
//     return child;
//   }
// }

// class _GalleryPreviewPage extends StatefulWidget {
//   final BoxDecoration? backgroundDecoration;
//   final dynamic minScale;
//   final dynamic maxScale;
//   final int initialIndex;
//   final PageController pageController;
//   final List<String> images;
//   final Axis scrollDirection;
//   _GalleryPreviewPage({
//     Key? key,
//     this.backgroundDecoration,
//     this.minScale,
//     this.maxScale,
//     this.initialIndex = 0,
//     required this.images,
//     this.scrollDirection = Axis.horizontal,
//   })  : pageController = PageController(initialPage: initialIndex),
//         super(key: key);

//   @override
//   __GalleryPreviewPageState createState() => __GalleryPreviewPageState();
// }

// class __GalleryPreviewPageState extends State<_GalleryPreviewPage> {
//   late int currentIndex = widget.initialIndex;

//   void onPageChanged(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: Navigator.of(context).pop,
//         child: Container(
//           decoration: widget.backgroundDecoration,
//           constraints: BoxConstraints.expand(
//             height: MediaQuery.of(context).size.height,
//           ),
//           child: Stack(
//             alignment: Alignment.bottomRight,
//             children: <Widget>[
//               PhotoViewGallery.builder(
//                 scrollPhysics: const BouncingScrollPhysics(),
//                 builder: (BuildContext context, int index) {
//                   final String item = widget.images[index];
//                   print("*****************))))))))))");
//                   print(item);
//                   return PhotoViewGalleryPageOptions(
//                     imageProvider: NetworkImage(item),
//                     initialScale: PhotoViewComputedScale.contained,
//                     minScale:
//                         PhotoViewComputedScale.contained * (0.5 + index / 10),
//                     maxScale: PhotoViewComputedScale.covered * 4.1,
//                     heroAttributes: PhotoViewHeroAttributes(tag: item),
//                   );
//                 },
//                 itemCount: widget.images.length,
//                 // loadingBuilder: widget.loadingBuilder,
//                 backgroundDecoration: widget.backgroundDecoration,
//                 pageController: widget.pageController,
//                 onPageChanged: onPageChanged,
//                 scrollDirection: widget.scrollDirection,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text(
//                   "Image ${currentIndex + 1}",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 17.0,
//                     decoration: null,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5_c/component/image/intertaive_photo_view.dart';
import 'package:taoju5_c/component/open_container/open_container.dart';

import 'package:flutter/cupertino.dart';

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
  final List<String> images;
  final bool hiddenZoomIcon;
  final String bigImageSrc;
  final bool cache;
  const ChimeraImage(
    this.src, {
    Key? key,
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
    this.images = const [],
    this.hiddenZoomIcon = true,
    this.bigImageSrc = "",
    this.cache = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        tappable: enlarge,
        openShape: RoundedRectangleBorder(borderRadius: borderRadius!),
        openElevation: 0,
        closedElevation: 0,
        closedShape: RoundedRectangleBorder(borderRadius: borderRadius!),
        openBuilder: (BuildContext context, _) {
          return InteractivePhotoView(imageUrl: src);
        },
        closedBuilder: (BuildContext context, _) {
          return CachedNetworkImage(
            imageUrl: src,
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
                        fit: BoxFit.contain),
                  );
                },
          );
        });
  }
}
