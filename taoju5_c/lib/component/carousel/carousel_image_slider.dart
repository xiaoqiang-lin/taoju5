/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-21 15:31:05
 * @LastEditTime: 2021-07-21 18:00:26
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/image/intertaive_photo_view.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'dart:math' as math;
import 'package:animations/animations.dart';

enum PagerShape { circle, roundRect, none }

class CarouselImageSlider extends StatefulWidget {
  final bool loop;
  final Color paginationColor;
  final double viewportFraction;
  final List<PictureEntity> pictures;
  final double? height;
  final double? width;
  final double? aspectRatio;
  final BorderRadius borderRadius;
  final PagerShape pagerShape;
  CarouselImageSlider(
      {Key? key,
      this.loop = false,
      this.paginationColor = Colors.white,
      required this.viewportFraction,
      this.pictures = const [],
      this.height,
      this.width,
      this.aspectRatio,
      this.borderRadius = BorderRadius.zero,
      this.pagerShape = PagerShape.roundRect})
      : assert((height != null) || (width != null && aspectRatio != null),
            "宽高信息必需任选其一"),
        super(key: key);

  @override
  _CarouselImageSlideState createState() => _CarouselImageSlideState();
}

class _CarouselImageSlideState extends State<CarouselImageSlider> {
  late SwiperController _controller;

  int _currentIndex = 0;

  double get maxAspectRatio {
    double max = 1;
    for (int i = 0; i < widget.pictures.length; i++) {
      max = math.max(max, widget.pictures[i].aspectRatio);
    }
    return max;
  }

  @override
  void initState() {
    _controller = SwiperController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? get height {
    if (widget.height != null) return widget.height;
    if (widget.aspectRatio != null && widget.width != null) {
      return widget.width! * widget.aspectRatio!;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer<int>(
        openShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        openElevation: 0,
        closedElevation: 0,
        middleColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        closedBuilder: (BuildContext context, _) {
          return Container(
            height: height,
            width: widget.width,
            alignment: Alignment.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Swiper(
                  controller: _controller,
                  loop: widget.loop,
                  onIndexChanged: (int i) {
                    setState(() {
                      _currentIndex = i;
                    });
                  },
                  viewportFraction: widget.viewportFraction,
                  itemBuilder: (BuildContext context, int i) {
                    PictureEntity item = widget.pictures[i];
                    return ChimeraImage(
                      item.cover,
                      borderRadius: widget.borderRadius,
                      enlarge: false,
                      fit: BoxFit.fill,
                      picture: item,
                      width: widget.width,
                      placeHolder: (BuildContext context, _) {
                        return Image.network(
                          item.thumbnail,
                          width: widget.width,
                          fit: BoxFit.cover,
                        );
                      },
                      // cacheWidth: widget.width?.toInt(),
                      // cacheHeight: height?.toInt(),
                    );
                  },
                  itemCount: widget.pictures.length,
                ),
                Positioned(
                  bottom: 5,
                  child: Visibility(
                    visible: widget.pictures.length > 1,
                    child: Container(
                      height: 7,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(.2)),
                      child: Row(
                        key: ValueKey(_currentIndex),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            widget.pictures.length,
                            (index) => GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = index;
                                      _controller.move(index);
                                    });
                                  },
                                  child: AnimatedContainer(
                                    key: ValueKey(index),
                                    margin: EdgeInsets.only(right: 5),
                                    duration: const Duration(milliseconds: 275),
                                    width: _currentIndex == index ? 20 : 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: _currentIndex == index
                                            ? widget.paginationColor
                                            : widget.paginationColor
                                                .withOpacity(.6),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        onClosed: (int? i) {
          print(i);
          print("退出大图预览时的下标");
        },
        openBuilder: (BuildContext context, _) {
          return InteractivePhotoView(pictures: widget.pictures);
        });
  }
}
