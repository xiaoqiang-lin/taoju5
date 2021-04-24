/*
 * @Description:大图查看可滑动
 * @Author: iamsmiling
 * @Date: 2021-04-23 09:14:01
 * @LastEditTime: 2021-04-23 22:36:45
 */
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:taoju5_c/component/indicator/image_load_progress_indicator.dart';

class ImageViewGallery extends StatefulWidget {
  final int currentIndex;

  ///缩略图
  final List<String> thumbnails;
  //大图
  final List<String> images;
  const ImageViewGallery(
      {Key? key,
      this.currentIndex = 0,
      required this.thumbnails,
      required this.images})
      : super(key: key);

  @override
  _ImageViewGalleryState createState() => _ImageViewGalleryState();
}

class _ImageViewGalleryState extends State<ImageViewGallery> {
  late PageController _controller;

  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double progress = 0;

  void _onPageChanged(int i) {
    _currentIndex = i;
  }

  Widget _loadingBuilder(BuildContext context, ImageChunkEvent? chunk) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
    if (chunk != null) {
      int currentLength = chunk.cumulativeBytesLoaded;
      int? totalLength = chunk.expectedTotalBytes;

      if (totalLength == null || totalLength == 0) {
        progress = 1;
      } else {
        progress = (currentLength / totalLength);
      }
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              // ChimeraImage(imageUrl: widget.thumbnails[_currentIndex]),
              ImageLoadingProgressIndicator(
                progress: progress,
                size: Size.fromRadius(96),
              ),
            ],
          ));
    }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(_currentIndex),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: Container(
                child: PhotoViewGallery.builder(
                  pageController: _controller,
                  scrollPhysics: const BouncingScrollPhysics(),
                  itemCount: widget.images.length,
                  loadingBuilder: _loadingBuilder,
                  onPageChanged: _onPageChanged,
                  builder: (BuildContext context, int i) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.images[i]),
                    );
                  },
                ),
              ),
            ),
            Positioned(
                right: 10,
                top: MediaQuery.of(context).padding.top,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(_currentIndex),
                  child: CircleAvatar(
                    radius: 16,
                    // backgroundColor: BColors.maskColor,
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
