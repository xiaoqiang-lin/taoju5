/*
 * @Description: 自定义图片
 * @Author: iamsmiling
 * @Date: 2021-04-21 09:58:17
 * @LastEditTime: 2021-05-17 10:47:28
 */

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5_c/component/image/image_view_gallery.dart';
import 'package:taoju5_c/component/image/intertaive_photo_view.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/open_container/open_container.dart';

import 'package:photo_view/photo_view.dart';

import 'package:extended_image/extended_image.dart';

class ChimeraImage extends StatefulWidget {
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
  final Widget Function(BuildContext, String)? placeHolder;
  final bool slidable;
  final List<String> images;
  final int currentIndex;
  final bool cache;

  ///是否需要动画
  final bool animated;
  final Positioned Function(BuildContext)? scaleBuilder;
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
      this.slidable = false,
      this.images = const [],
      this.currentIndex = 0,
      this.animated = true,
      this.scaleBuilder,
      this.cache = false})
      : super(key: key);

  @override
  _ChimeraImageState createState() => _ChimeraImageState();
}

class _ChimeraImageState extends State<ChimeraImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 375),
        lowerBound: 0.0,
        upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onTap(BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Hero(tag: widget.imageUrl, child: Image.network(widget.imageUrl));
      return widget.slidable
          ? ImageViewGallery(
              images: widget.images,
              currentIndex: widget.currentIndex,
            )
          : InteractivePhotoView(imageUrl: widget.imageUrl);
      // if (slidable) {
      //   return ImageViewGallery(
      //     images: images,
      //     currentIndex: currentIndex,
      //   );
      // }
      // return InteractivePhotoView(imageUrl: imageUrl);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: ExtendedImage.network(
        widget.imageUrl,
        borderRadius: widget.borderRadius,
        cache: widget.cache,
        width: widget.width,
        height: widget.height,
        cacheRawData: false,
        fit: widget.fit,
        initGestureConfigHandler: (ExtendedImageState state) {
          return GestureConfig(
            minScale: 0.9,
            animationMinScale: 0.7,
            maxScale: 4.0,
            animationMaxScale: 4.5,
            speed: 1.0,
            inertialSpeed: 100.0,
            initialScale: 1.0,
            inPageView: false,
            initialAlignment: InitialAlignment.center,
            gestureDetailsIsChanged: (GestureDetails? details) {
              //print(details?.totalScale);
            },
          );
        },
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              _controller.reset();

              return Shimmer.fromColors(
                period: const Duration(milliseconds: 1000),
                baseColor: const Color(0xFFF5F5F5),
                highlightColor: Colors.white,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: widget.borderRadius),
                ),
              );
            case LoadState.completed:
              _controller.forward();

              ///if you don't want override completed widget
              ///please return null or state.completedWidget
              //return null;
              //return state.completedWidget;
              return FadeTransition(
                opacity: _controller,
                child: ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              );
            case LoadState.failed:
              _controller.reset();
              //remove memory cached
              state.imageProvider.evict();
              return Image.asset(
                "resources/images/image_error.png",
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
              );
          }
        },
      ),
    );
    return PhotoViewGestureDetectorScope(
      child: PhotoView(
        tightMode: true,
        customSize: widget.width != null
            ? Size.fromWidth(widget.width!)
            : widget.height != null
                ? Size.fromHeight(widget.height!)
                : widget.width != null && widget.height != null
                    ? Size(widget.width!, widget.height!)
                    : MediaQuery.of(context).size,
        backgroundDecoration: BoxDecoration(
            borderRadius: widget.borderRadius, color: Colors.transparent),
        imageProvider: NetworkImage(widget.imageUrl, scale: .5),
        // loadingBuilder:Cupertinini,
        errorBuilder: (BuildContext context, _, __) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: widget.borderRadius),
            child: Image.asset("resources/images/image_error.png",
                fit: BoxFit.contain),
          );
        },
      ),
    );
    return Stack(
      children: [
        Hero(
          tag: widget.imageUrl,
          child: Material(
            child: GestureDetector(
              onTap: () => _onTap(context),
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                // cacheManager: ,
                fadeInDuration: widget.fadeInDuration,
                fadeOutDuration: widget.fadeOutDuration,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                placeholderFadeInDuration: widget.placeholderFadeInDuration,
                placeholder: widget.placeHolder ??
                    (BuildContext context, String desc) {
                      return Shimmer.fromColors(
                        period: const Duration(milliseconds: 1000),
                        baseColor: const Color(0xFFF5F5F5),
                        highlightColor: Colors.white,
                        child: Container(
                          width: widget.width,
                          height: widget.height,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: widget.borderRadius),
                        ),
                      );
                    },
                errorWidget: widget.errorWidget ??
                    (BuildContext context, String desc, _) {
                      return Container(
                        width: widget.width,
                        height: widget.height,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: widget.borderRadius),
                        child: Image.asset("resources/images/image_error.png",
                            fit: BoxFit.contain),
                      );
                    },
              ),
            ),
          ),
        ),
        Positioned(
            top: 7,
            right: 7,
            child: GestureDetector(
                child: Image.asset("resources/images/scale.png")))
      ],
    );
    // return OpenContainer<int>(
    //     key: ObjectKey(imageUrl),
    //     tappable: enlarge,
    //     transitionType: ContainerTransitionType.fade,
    //     openShape: RoundedRectangleBorder(borderRadius: borderRadius!),
    //     openElevation: 0,
    //     closedElevation: 0,
    //     closedShape: RoundedRectangleBorder(borderRadius: borderRadius!),
    //     openBuilder: (BuildContext context, print) {
    //       if (slidable) {
    //         return ImageViewGallery(
    //           images: images,
    //           currentIndex: currentIndex,
    //         );
    //       }
    //       return InteractivePhotoView(
    //         imageUrl: imageUrl,
    //       );
    //     },
    //     closedBuilder: (BuildContext context, print) {
    //       return Stack(
    //         children: [
    //           Visibility(
    //               visible: !animated,
    //               child: Image.network(
    //                 imageUrl,
    //                 width: width,
    //                 height: height,
    //                 fit: fit,
    //               )),
    //           Visibility(
    //             visible: animated,
    //             child: CachedNetworkImage(
    //               imageUrl: imageUrl,
    //               // cacheManager: ,
    //               fadeInDuration: fadeInDuration,
    //               fadeOutDuration: fadeOutDuration,
    //               width: width,
    //               height: height,
    //               fit: fit,
    //               placeholderFadeInDuration: placeholderFadeInDuration,
    //               placeholder: placeHolder ??
    //                   (BuildContext context, String desc) {
    // return Shimmer.fromColors(
    //   period: const Duration(milliseconds: 1000),
    //   baseColor: const Color(0xFFF5F5F5),
    //   highlightColor: Colors.white,
    //   child: Container(
    //     width: width,
    //     height: height,
    //     decoration: BoxDecoration(
    //         color: const Color(0xFFF5F5F5),
    //         borderRadius: borderRadius),
    //   ),
    // );
    //                   },
    //               errorWidget: errorWidget ??
    //                   (BuildContext context, String desc, _) {
    //                     return Container(
    //                       width: width,
    //                       height: height,
    //                       decoration: BoxDecoration(
    //                           color: const Color(0xFFF5F5F5),
    //                           borderRadius: borderRadius),
    //                       child: Image.asset("resources/images/image_error.png",
    //                           fit: BoxFit.contain),
    //                     );
    //                   },
    //             ),
    //           ),
    //           Positioned(
    //               top: 7,
    //               right: 7,
    //               child: GestureDetector(
    //                   onTap: () {},
    //                   child: Image.asset("resources/images/scale.png")))
    //         ],
    //       );
    //     });
  }
}

// typedef CloseContainerActionCallback<S> = void Function({S? returnValue});

// typedef OpenContainerBuilder<S> = Widget Function(
//   BuildContext context,
//   CloseContainerActionCallback<S> action,
// );

// typedef CloseContainerBuilder = Widget Function(
//   BuildContext context,
//   VoidCallback action,
// );

// enum ContainerTransitionType {
//   /// Fades the incoming element in over the outgoing element.
//   fade,

//   /// First fades the outgoing element out, and starts fading the incoming
//   /// element in once the outgoing element has completely faded out.
//   fadeThrough,
// }

// typedef ClosedCallback<S> = void Function(S data);

// class _FlippableTweenSequence<T> extends TweenSequence<T> {
//   _FlippableTweenSequence(this._items) : super(_items);

//   final List<TweenSequenceItem<T>> _items;
//   _FlippableTweenSequence<T>? _flipped;

//   _FlippableTweenSequence<T>? get flipped {
//     if (_flipped == null) {
//       final List<TweenSequenceItem<T>> newItems = <TweenSequenceItem<T>>[];
//       for (int i = 0; i < _items.length; i++) {
//         newItems.add(TweenSequenceItem<T>(
//           tween: _items[i].tween,
//           weight: _items[_items.length - 1 - i].weight,
//         ));
//       }
//       _flipped = _FlippableTweenSequence<T>(newItems);
//     }
//     return _flipped;
//   }
// }

// class _HideableStateController extends GetxController {
//   Size? get placeholderSize => _placeholderSize;
//   Size? _placeholderSize;
//   set placeholderSize(Size? value) {
//     if (_placeholderSize == value) {
//       return;
//     }
//     _placeholderSize = value;
//     update();
//   }

//   /// When true the child is not visible, but will maintain its size.
//   ///
//   /// The value of this property is ignored when [placeholderSize] is non-null
//   /// (i.e. [isInTree] returns false).
//   bool get isVisible => _visible;
//   bool _visible = true;
//   set isVisible(bool value) {
//     if (_visible == value) {
//       return;
//     }
//     _visible = value;
//     update();
//   }

//   /// Whether the child is currently included in the tree.
//   ///
//   /// When it is included, it may be visible or not according to [isVisible].
//   bool get isInTree => _placeholderSize == null;
// }

// class _Hideable extends StatelessWidget {
//   final Widget child;
//   const _Hideable({Key? key, required this.child}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<_HideableStateController>(
//       init: _HideableStateController(),
//       builder: (_) {
//         if (_.placeholderSize != null) {
//           return SizedBox.fromSize(size: _.placeholderSize);
//         }
//         return Opacity(
//           opacity: _.isVisible ? 1.0 : 0.0,
//           child: child,
//         );
//       },
//     );
//   }
// }

// class _OpenContainerRoute<T> extends ModalRoute<T> {
//   _OpenContainerRoute({
//     required this.closedColor,
//     required this.openColor,
//     required this.middleColor,
//     required double closedElevation,
//     required this.openElevation,
//     required ShapeBorder closedShape,
//     required this.openShape,
//     required this.closedBuilder,
//     required this.openBuilder,
//     required this.hideBuilderContext,
//     required this.closeBuilderContext,
//     required this.transitionDuration,
//     required this.transitionType,
//     required this.useRootNavigator,
//     required RouteSettings? routeSettings,
//   })   : _elevationTween = Tween<double>(
//           begin: closedElevation,
//           end: openElevation,
//         ),
//         _shapeTween = ShapeBorderTween(
//           begin: closedShape,
//           end: openShape,
//         ),
//         _colorTween = _getColorTween(
//           transitionType: transitionType,
//           closedColor: closedColor,
//           openColor: openColor,
//           middleColor: middleColor,
//         ),
//         _closedOpacityTween = _getClosedOpacityTween(transitionType),
//         _openOpacityTween = _getOpenOpacityTween(transitionType),
//         super(settings: routeSettings);
//   static _FlippableTweenSequence<Color?> _getColorTween({
//     required ContainerTransitionType transitionType,
//     required Color closedColor,
//     required Color openColor,
//     required Color middleColor,
//   }) {
//     switch (transitionType) {
//       case ContainerTransitionType.fade:
//         return _FlippableTweenSequence<Color?>(
//           <TweenSequenceItem<Color?>>[
//             TweenSequenceItem<Color>(
//               tween: ConstantTween<Color>(closedColor),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<Color?>(
//               tween: ColorTween(begin: closedColor, end: openColor),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<Color>(
//               tween: ConstantTween<Color>(openColor),
//               weight: 3 / 5,
//             ),
//           ],
//         );
//       case ContainerTransitionType.fadeThrough:
//         return _FlippableTweenSequence<Color?>(
//           <TweenSequenceItem<Color?>>[
//             TweenSequenceItem<Color?>(
//               tween: ColorTween(begin: closedColor, end: middleColor),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<Color?>(
//               tween: ColorTween(begin: middleColor, end: openColor),
//               weight: 4 / 5,
//             ),
//           ],
//         );
//     }
//   }

//   static _FlippableTweenSequence<double> _getClosedOpacityTween(
//       ContainerTransitionType transitionType) {
//     switch (transitionType) {
//       case ContainerTransitionType.fade:
//         return _FlippableTweenSequence<double>(
//           <TweenSequenceItem<double>>[
//             TweenSequenceItem<double>(
//               tween: ConstantTween<double>(1.0),
//               weight: 1,
//             ),
//           ],
//         );
//       case ContainerTransitionType.fadeThrough:
//         return _FlippableTweenSequence<double>(
//           <TweenSequenceItem<double>>[
//             TweenSequenceItem<double>(
//               tween: Tween<double>(begin: 1.0, end: 0.0),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<double>(
//               tween: ConstantTween<double>(0.0),
//               weight: 4 / 5,
//             ),
//           ],
//         );
//     }
//   }

//   static _FlippableTweenSequence<double> _getOpenOpacityTween(
//       ContainerTransitionType transitionType) {
//     switch (transitionType) {
//       case ContainerTransitionType.fade:
//         return _FlippableTweenSequence<double>(
//           <TweenSequenceItem<double>>[
//             TweenSequenceItem<double>(
//               tween: ConstantTween<double>(0.0),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<double>(
//               tween: Tween<double>(begin: 0.0, end: 1.0),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<double>(
//               tween: ConstantTween<double>(1.0),
//               weight: 3 / 5,
//             ),
//           ],
//         );
//       case ContainerTransitionType.fadeThrough:
//         return _FlippableTweenSequence<double>(
//           <TweenSequenceItem<double>>[
//             TweenSequenceItem<double>(
//               tween: ConstantTween<double>(0.0),
//               weight: 1 / 5,
//             ),
//             TweenSequenceItem<double>(
//               tween: Tween<double>(begin: 0.0, end: 1.0),
//               weight: 4 / 5,
//             ),
//           ],
//         );
//     }
//   }

//   final Color closedColor;
//   final Color openColor;
//   final Color middleColor;
//   final double openElevation;
//   final ShapeBorder openShape;
//   final CloseContainerBuilder closedBuilder;
//   final OpenContainerBuilder<T> openBuilder;

//   // See [_OpenContainerState._hideableKey].
//   // final GlobalKey<_HideableState> hideableKey;

//   // // See [_OpenContainerState._closedBuilderKey].
//   // final GlobalKey closedBuilderKey;

//   late BuildContext closeBuilderContext;

//   late BuildContext hideBuilderContext;

//   @override
//   final Duration transitionDuration;
//   final ContainerTransitionType transitionType;

//   final bool useRootNavigator;

//   final Tween<double> _elevationTween;
//   final ShapeBorderTween _shapeTween;
//   final _FlippableTweenSequence<double> _closedOpacityTween;
//   final _FlippableTweenSequence<double> _openOpacityTween;
//   final _FlippableTweenSequence<Color?> _colorTween;

//   static final TweenSequence<Color?> _scrimFadeInTween = TweenSequence<Color?>(
//     <TweenSequenceItem<Color?>>[
//       TweenSequenceItem<Color?>(
//         tween: ColorTween(begin: Colors.transparent, end: Colors.black54),
//         weight: 1 / 5,
//       ),
//       TweenSequenceItem<Color>(
//         tween: ConstantTween<Color>(Colors.black54),
//         weight: 4 / 5,
//       ),
//     ],
//   );
//   static final Tween<Color?> _scrimFadeOutTween = ColorTween(
//     begin: Colors.transparent,
//     end: Colors.black54,
//   );

//   // Key used for the widget returned by [OpenContainer.openBuilder] to keep
//   // its state when the shape of the widget tree is changed at the end of the
//   // animation to remove all the craft that was necessary to make the animation
//   // work.
//   // final GlobalKey _openBuilderKey = GlobalKey();

//   // Defines the position and the size of the (opening) [OpenContainer] within
//   // the bounds of the enclosing [Navigator].
//   final RectTween _rectTween = RectTween();

//   AnimationStatus? _lastAnimationStatus;
//   AnimationStatus? _currentAnimationStatus;

//   @override
//   TickerFuture didPush() {
//     _takeMeasurements(navigatorContext: hideBuilderContext);

//     animation!.addStatusListener((AnimationStatus status) {
//       _lastAnimationStatus = _currentAnimationStatus;
//       _currentAnimationStatus = status;
//       switch (status) {
//         case AnimationStatus.dismissed:
//           _toggleHideable(hide: false);
//           break;
//         case AnimationStatus.completed:
//           _toggleHideable(hide: true);
//           break;
//         case AnimationStatus.forward:
//         case AnimationStatus.reverse:
//           break;
//       }
//     });

//     return super.didPush();
//   }

//   @override
//   bool didPop(T? result) {
//     _takeMeasurements(
//       navigatorContext: subtreeContext!,
//       delayForSourceRoute: true,
//     );
//     return super.didPop(result);
//   }

//   _HideableStateController? get _hideableStateController {
//     if (Get.isRegistered<_HideableStateController>()) return null;
//     return Get.find<_HideableStateController>();
//   }

//   @override
//   void dispose() {
//     if (_hideableStateController?.isVisible == false) {
//       SchedulerBinding.instance!
//           .addPostFrameCallback((Duration d) => _toggleHideable(hide: false));
//     }

//     super.dispose();
//   }

//   void _toggleHideable({required bool hide}) {
//     if (_hideableStateController == null) return;
//     _hideableStateController!
//       ..placeholderSize = null
//       ..isVisible = !hide;
//     // if(Get.find<_HideableStateController>())
//     // if (hideableKey.currentState != null) {
//     //   hideableKey.currentState!
//     //     ..placeholderSize = null
//     //     ..isVisible = !hide;
//     // }
//   }

//   void _takeMeasurements({
//     required BuildContext navigatorContext,
//     bool delayForSourceRoute = false,
//   }) {
//     final RenderBox navigator = Navigator.of(
//       navigatorContext,
//       rootNavigator: useRootNavigator,
//     ).context.findRenderObject() as RenderBox;
//     final Size navSize = _getSize(navigator);
//     _rectTween.end = Offset.zero & navSize;

//     void takeMeasurementsInSourceRoute([Duration? _]) {
//       if (!navigator.attached) {
//         return;
//       }
//       _rectTween.begin = _getRect(hideBuilderContext, navigator);
//       _hideableStateController?.placeholderSize = _rectTween.begin!.size;
//     }

//     if (delayForSourceRoute) {
//       SchedulerBinding.instance!
//           .addPostFrameCallback(takeMeasurementsInSourceRoute);
//     } else {
//       takeMeasurementsInSourceRoute();
//     }
//   }

//   Size _getSize(RenderBox render) {
//     assert(render.hasSize);
//     return render.size;
//   }

//   // Returns the bounds of the [RenderObject] identified by `key` in the
//   // coordinate system of `ancestor`.
//   Rect _getRect(BuildContext context, RenderBox ancestor) {
//     assert(ancestor.hasSize);
//     final RenderBox render = context.findRenderObject() as RenderBox;
//     assert(render.hasSize);
//     return MatrixUtils.transformRect(
//       render.getTransformTo(ancestor),
//       Offset.zero & render.size,
//     );
//   }

//   bool get _transitionWasInterrupted {
//     bool wasInProgress = false;
//     bool isInProgress = false;

//     switch (_currentAnimationStatus) {
//       case AnimationStatus.completed:
//       case AnimationStatus.dismissed:
//         isInProgress = false;
//         break;
//       case AnimationStatus.forward:
//       case AnimationStatus.reverse:
//         isInProgress = true;
//         break;
//       case null:
//         break;
//     }
//     switch (_lastAnimationStatus) {
//       case AnimationStatus.completed:
//       case AnimationStatus.dismissed:
//         wasInProgress = false;
//         break;
//       case AnimationStatus.forward:
//       case AnimationStatus.reverse:
//         wasInProgress = true;
//         break;
//       case null:
//         break;
//     }
//     return wasInProgress && isInProgress;
//   }

//   void closeContainer({T? returnValue}) {
//     Navigator.of(subtreeContext!).pop(returnValue);
//   }

//   @override
//   bool get maintainState => true;

//   @override
//   Color? get barrierColor => null;

//   @override
//   bool get opaque => true;

//   @override
//   bool get barrierDismissible => false;

//   @override
//   String? get barrierLabel => null;

//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return Align(
//         alignment: Alignment.topLeft,
//         child: AnimatedBuilder(
//           animation: animation,
//           builder: (BuildContext context, Widget? child) {
//             if (animation.isCompleted) {
//               return SizedBox.expand(
//                 child: Material(
//                   color: openColor,
//                   elevation: openElevation,
//                   shape: openShape,
//                   child: Builder(
//                     // key: _openBuilderKey,
//                     builder: (BuildContext context) {
//                       return openBuilder(context, closeContainer);
//                     },
//                   ),
//                 ),
//               );
//             }

//             final Animation<double> curvedAnimation = CurvedAnimation(
//               parent: animation,
//               curve: Curves.fastOutSlowIn,
//               reverseCurve: _transitionWasInterrupted
//                   ? null
//                   : Curves.fastOutSlowIn.flipped,
//             );
//             TweenSequence<Color?>? colorTween;
//             TweenSequence<double>? closedOpacityTween, openOpacityTween;
//             Animatable<Color?>? scrimTween;
//             switch (animation.status) {
//               case AnimationStatus.dismissed:
//               case AnimationStatus.forward:
//                 closedOpacityTween = _closedOpacityTween;
//                 openOpacityTween = _openOpacityTween;
//                 colorTween = _colorTween;
//                 scrimTween = _scrimFadeInTween;
//                 break;
//               case AnimationStatus.reverse:
//                 if (_transitionWasInterrupted) {
//                   closedOpacityTween = _closedOpacityTween;
//                   openOpacityTween = _openOpacityTween;
//                   colorTween = _colorTween;
//                   scrimTween = _scrimFadeInTween;
//                   break;
//                 }
//                 closedOpacityTween = _closedOpacityTween.flipped;
//                 openOpacityTween = _openOpacityTween.flipped;
//                 colorTween = _colorTween.flipped;
//                 scrimTween = _scrimFadeOutTween;
//                 break;
//               case AnimationStatus.completed:
//                 assert(false); // Unreachable.
//                 break;
//             }
//             assert(colorTween != null);
//             assert(closedOpacityTween != null);
//             assert(openOpacityTween != null);
//             assert(scrimTween != null);

//             final Rect rect = _rectTween.evaluate(curvedAnimation)!;
//             return SizedBox.expand(
//               child: Container(
//                 color: scrimTween!.evaluate(curvedAnimation),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Transform.translate(
//                     offset: Offset(rect.left, rect.top),
//                     child: SizedBox(
//                       width: rect.width,
//                       height: rect.height,
//                       child: Material(
//                         clipBehavior: Clip.antiAlias,
//                         animationDuration: Duration.zero,
//                         color: colorTween!.evaluate(animation),
//                         shape: _shapeTween.evaluate(curvedAnimation),
//                         elevation: _elevationTween.evaluate(curvedAnimation),
//                         child: Stack(
//                           fit: StackFit.passthrough,
//                           children: <Widget>[
//                             // Closed child fading out.
//                             FittedBox(
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topLeft,
//                               child: SizedBox(
//                                 width: _rectTween.begin!.width,
//                                 height: _rectTween.begin!.height,
//                                 child: (_hideableStateController?.isInTree ??
//                                         false)
//                                     ? null
//                                     : Opacity(
//                                         opacity: closedOpacityTween!
//                                             .evaluate(animation),
//                                         child: Builder(
//                                           // key: closedBuilderKey,
//                                           builder: (BuildContext context) {
//                                             closeBuilderContext = context;
//                                             // Use dummy "open container" callback
//                                             // since we are in the process of opening.
//                                             return closedBuilder(
//                                                 context, () {});
//                                           },
//                                         ),
//                                       ),
//                               ),
//                             ),

//                             // Open child fading in.
//                             FittedBox(
//                               fit: BoxFit.fitWidth,
//                               alignment: Alignment.topLeft,
//                               child: SizedBox(
//                                 width: _rectTween.end!.width,
//                                 height: _rectTween.end!.height,
//                                 child: Opacity(
//                                   opacity:
//                                       openOpacityTween!.evaluate(animation),
//                                   child: Builder(
//                                     // key: _openBuilderKey,
//                                     builder: (BuildContext context) {
//                                       return openBuilder(
//                                           context, closeContainer);
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ));
//   }
// }

// class OpenContainerController extends GetxController {
//   late BuildContext closeBuilderContext;
//   late BuildContext hideBuilderContext;
//   Future<void> openContainer(OpenContainer widget, BuildContext context) async {
//     final Color middleColor =
//         widget.middleColor ?? Theme.of(context).canvasColor;
//     final data = await Navigator.of(
//       context,
//       rootNavigator: widget.useRootNavigator,
//     ).push(_OpenContainerRoute(
//       closedColor: widget.closedColor,
//       openColor: widget.openColor,
//       middleColor: middleColor,
//       closedElevation: widget.closedElevation,
//       openElevation: widget.openElevation,
//       closedShape: widget.closedShape,
//       openShape: widget.openShape,
//       closedBuilder: widget.closedBuilder,
//       openBuilder: widget.openBuilder,
//       hideBuilderContext: hideBuilderContext,
//       closeBuilderContext: closeBuilderContext,
//       transitionDuration: widget.transitionDuration,
//       transitionType: widget.transitionType,
//       useRootNavigator: widget.useRootNavigator,
//       routeSettings: widget.routeSettings,
//     ));
//     if (widget.onClosed != null) {
//       widget.onClosed!(data);
//     }
//   }
// }

// class OpenContainer<T extends Object?> extends StatelessWidget {
//   const OpenContainer({
//     Key? key,
//     this.closedColor = Colors.white,
//     this.openColor = Colors.white,
//     this.middleColor,
//     this.closedElevation = 1.0,
//     this.openElevation = 4.0,
//     this.closedShape = const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(4.0)),
//     ),
//     this.openShape = const RoundedRectangleBorder(),
//     this.onClosed,
//     required this.closedBuilder,
//     required this.openBuilder,
//     this.tappable = true,
//     this.transitionDuration = const Duration(milliseconds: 300),
//     this.transitionType = ContainerTransitionType.fade,
//     this.useRootNavigator = false,
//     this.routeSettings,
//     this.clipBehavior = Clip.antiAlias,
//   }) : super(key: key);

//   /// Background color of the container while it is closed.
//   ///
//   /// When the container is opened, it will first transition from this color
//   /// to [middleColor] and then transition from there to [openColor] in one
//   /// smooth animation. When the container is closed, it will transition back to
//   /// this color from [openColor] via [middleColor].
//   ///
//   /// Defaults to [Colors.white].
//   ///
//   /// See also:
//   ///
//   ///  * [Material.color], which is used to implement this property.
//   final Color closedColor;

//   /// Background color of the container while it is open.
//   ///
//   /// When the container is closed, it will first transition from [closedColor]
//   /// to [middleColor] and then transition from there to this color in one
//   /// smooth animation. When the container is closed, it will transition back to
//   /// [closedColor] from this color via [middleColor].
//   ///
//   /// Defaults to [Colors.white].
//   ///
//   /// See also:
//   ///
//   ///  * [Material.color], which is used to implement this property.
//   final Color openColor;

//   /// The color to use for the background color during the transition
//   /// with [ContainerTransitionType.fadeThrough].
//   ///
//   /// Defaults to [Theme]'s [ThemeData.canvasColor].
//   ///
//   /// See also:
//   ///
//   ///  * [Material.color], which is used to implement this property.
//   final Color? middleColor;

//   /// Elevation of the container while it is closed.
//   ///
//   /// When the container is opened, it will transition from this elevation to
//   /// [openElevation]. When the container is closed, it will transition back
//   /// from [openElevation] to this elevation.
//   ///
//   /// Defaults to 1.0.
//   ///
//   /// See also:
//   ///
//   ///  * [Material.elevation], which is used to implement this property.
//   final double closedElevation;

//   /// Elevation of the container while it is open.
//   ///
//   /// When the container is opened, it will transition to this elevation from
//   /// [closedElevation]. When the container is closed, it will transition back
//   /// from this elevation to [closedElevation].
//   ///
//   /// Defaults to 4.0.
//   ///
//   /// See also:
//   ///
//   ///  * [Material.elevation], which is used to implement this property.
//   final double openElevation;

//   /// Shape of the container while it is closed.
//   ///
//   /// When the container is opened it will transition from this shape to
//   /// [openShape]. When the container is closed, it will transition back to this
//   /// shape.
//   ///
//   /// Defaults to a [RoundedRectangleBorder] with a [Radius.circular] of 4.0.
//   ///
//   /// See also:
//   ///
//   ///  * [Material.shape], which is used to implement this property.
//   final ShapeBorder closedShape;

//   /// Shape of the container while it is open.
//   ///
//   /// When the container is opened it will transition from [closedShape] to
//   /// this shape. When the container is closed, it will transition from this
//   /// shape back to [closedShape].
//   ///
//   /// Defaults to a rectangular.
//   ///
//   /// See also:
//   ///
//   ///  * [Material.shape], which is used to implement this property.
//   final ShapeBorder openShape;

//   /// Called when the container was popped and has returned to the closed state.
//   ///
//   /// The return value from the popped screen is passed to this function as an
//   /// argument.
//   ///
//   /// If no value is returned via [Navigator.pop] or [OpenContainer.openBuilder.action],
//   /// `null` will be returned by default.
//   final ClosedCallback<T?>? onClosed;

//   /// Called to obtain the child for the container in the closed state.
//   ///
//   /// The [Widget] returned by this builder is faded out when the container
//   /// opens and at the same time the widget returned by [openBuilder] is faded
//   /// in while the container grows to fill the surrounding [Navigator].
//   ///
//   /// The `action` callback provided to the builder can be called to open the
//   /// container.
//   final CloseContainerBuilder closedBuilder;

//   /// Called to obtain the child for the container in the open state.
//   ///
//   /// The [Widget] returned by this builder is faded in when the container
//   /// opens and at the same time the widget returned by [closedBuilder] is
//   /// faded out while the container grows to fill the surrounding [Navigator].
//   ///
//   /// The `action` callback provided to the builder can be called to close the
//   /// container.
//   final OpenContainerBuilder<T> openBuilder;

//   /// Whether the entire closed container can be tapped to open it.
//   ///
//   /// Defaults to true.
//   ///
//   /// When this is set to false the container can only be opened by calling the
//   /// `action` callback that is provided to the [closedBuilder].
//   final bool tappable;

//   /// The time it will take to animate the container from its closed to its
//   /// open state and vice versa.
//   ///
//   /// Defaults to 300ms.
//   final Duration transitionDuration;

//   /// The type of fade transition that the container will use for its
//   /// incoming and outgoing widgets.
//   ///
//   /// Defaults to [ContainerTransitionType.fade].
//   final ContainerTransitionType transitionType;

//   /// The [useRootNavigator] argument is used to determine whether to push the
//   /// route for [openBuilder] to the Navigator furthest from or nearest to
//   /// the given context.
//   ///
//   /// By default, [useRootNavigator] is false and the route created will push
//   /// to the nearest navigator.
//   final bool useRootNavigator;

//   /// Provides additional data to the [openBuilder] route pushed by the Navigator.
//   final RouteSettings? routeSettings;

//   /// The [closedBuilder] will be clipped (or not) according to this option.
//   ///
//   /// Defaults to [Clip.antiAlias], and must not be null.
//   ///
//   /// See also:
//   ///
//   ///  * [Material.clipBehavior], which is used to implement this property.
//   final Clip clipBehavior;

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OpenContainerController>(
//       init: OpenContainerController(),
//       builder: (_) {
//         return Builder(builder: (context) {
//           _.hideBuilderContext = context;
//           return _Hideable(
//             child: GestureDetector(
//               onTap: tappable ? () => _.openContainer(this, context) : null,
//               child: Material(
//                 clipBehavior: clipBehavior,
//                 color: closedColor,
//                 elevation: closedElevation,
//                 shape: closedShape,
//                 child: Builder(
//                   builder: (BuildContext context) {
//                     _.closeBuilderContext = context;
//                     return closedBuilder(
//                         context, () => _.openContainer(this, context));
//                   },
//                 ),
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
// }
