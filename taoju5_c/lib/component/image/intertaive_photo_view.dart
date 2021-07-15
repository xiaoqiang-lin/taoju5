/*
 * @Description: 大图预览
 * @Author: iamsmiling
 * @Date: 2021-04-21 16:31:31
 * @LastEditTime: 2021-06-22 15:21:49
 */
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';

class InteractivePhotoView extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<PictureEntity> pictures;
  final Axis scrollDirection;
  final ImageProvider? imageProvider;

  InteractivePhotoView({
    Key? key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.pictures,
    this.scrollDirection = Axis.horizontal,
    this.imageProvider,
  })  : pageController = PageController(initialPage: initialIndex),
        super(key: key);

  @override
  _InteractivePhotoViewState createState() => _InteractivePhotoViewState();
}

class _InteractivePhotoViewState extends State<InteractivePhotoView>
    with SingleTickerProviderStateMixin {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: Colors.black,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              top: 20,
              bottom: 20,
              left: 0,
              right: 0,
              child: PhotoViewGallery.builder(
                itemCount: widget.pictures.length,
                onPageChanged: onPageChanged,
                builder: (BuildContext context, int i) {
                  PictureEntity item = widget.pictures[i];
                  return PhotoViewGalleryPageOptions(
                    imageProvider: ExtendedNetworkImageProvider(item.bigImage,
                        cache: true),
                    initialScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained * (0.5 + i / 10),
                    maxScale: PhotoViewComputedScale.covered * 4.1,
                  );
                },
              ),
            ),
            Positioned(
                left: 24,
                top: MediaQuery.of(context).padding.top,
                child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Image.asset("resources/images/close_image.png"))),
            Visibility(
              visible: widget.pictures.length > 1,
              child: Positioned(
                  top: MediaQuery.of(context).padding.top,
                  child: Text(
                    "${currentIndex + 1}/${widget.pictures.length}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
