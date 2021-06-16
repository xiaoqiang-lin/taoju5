/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-21 15:31:05
 * @LastEditTime: 2021-06-10 17:17:29
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
// ignore: import_of_legacy_library_into_null_safe

class CarouselSlide extends StatefulWidget {
  final int itemCount;
  final bool loop;
  final Color paginationColor;
  final double viewportFraction;
  final double itemHeight;
  final double itemWidth;

  final IndexedWidgetBuilder itemBuilder;
  final List<String>? thunmbnails;
  final List<String>? bigImages;
  CarouselSlide(
      {Key? key,
      this.loop = false,
      required this.itemCount,
      this.paginationColor = Colors.white,
      required this.viewportFraction,
      required this.itemHeight,
      required this.itemWidth,
      required this.itemBuilder,
      this.thunmbnails,
      this.bigImages})
      : super(key: key);

  @override
  _CarouselSlideState createState() => _CarouselSlideState();
}

class _CarouselSlideState extends State<CarouselSlide> {
  late SwiperController _controller;

  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.itemHeight,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // PhotoViewGallery.builder(
          //   itemCount: widget.thunmbnails!.length,
          //   builder: (BuildContext context, int index) {
          //     return PhotoViewGalleryPageOptions(
          //       imageProvider: NetworkImage(widget.thunmbnails![index]),
          //       initialScale: PhotoViewComputedScale.contained,
          //       heroAttributes:
          //           PhotoViewHeroAttributes(tag: widget.thunmbnails![index]),
          //     );
          //   },
          // ),
          Swiper(
            controller: _controller,
            loop: widget.loop,
            onIndexChanged: (int i) {
              setState(() {
                _currentIndex = i;
              });
            },
            itemCount: widget.thunmbnails!.length,
            viewportFraction: widget.viewportFraction,
            itemBuilder: (BuildContext context, int i) {
              return ChimeraImage(
                widget.thunmbnails![i],
                borderRadius: BorderRadius.zero,
                enlarge: true,
                fit: BoxFit.cover,
                // heroTag: widget.bigImages![i],
              );
              // return OpenContainer<int?>(onClosed: (int? val) {
              //   if (val == null) return;
              //   if (_currentIndex != i) {
              //     _controller.move(i);
              //   }
              //   _currentIndex = i;
              // }, closedBuilder: (BuildContext context, _) {
              //   return widget.itemBuilder(context, i);
              // }, openBuilder: (BuildContext context, _) {
              //   return ImageViewGallery(
              //     currentIndex: _currentIndex,
              //     images: widget.bigImages ?? [],
              //   );
              // });
            },
            itemHeight: widget.itemHeight,
            itemWidth: widget.itemWidth,
          ),
          Positioned(
            bottom: 5,
            child: Visibility(
              visible: widget.itemCount > 1,
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
                      widget.itemCount,
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
                                      : widget.paginationColor.withOpacity(.6),
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
