/*
 * @Description: 可预览的图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:17:49
 * @LastEditTime: 2021-02-20 12:34:56
 */

import 'package:animations/animations.dart';
import 'package:taoju5_b/ui/widgets/common/x_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class XPhotoViewer<T> extends StatelessWidget {
  final String url;
  final String bigImageUrl;
  final BoxFit fit;
  final double height;
  final double width;
  final ShapeBorder closedShape;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final OpenContainerBuilder<T> openBuilder;
  final PlaceholderWidgetBuilder placeholder;
  final Duration placeholderFadeInDuration;
  final String thumbnail;
  const XPhotoViewer(
      {Key key,
      @required this.url,
      this.bigImageUrl,
      this.fit,
      this.height,
      this.width,
      this.closedShape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      this.fadeOutDuration,
      this.fadeInDuration = const Duration(milliseconds: 375),
      this.openBuilder,
      this.placeholder,
      this.placeholderFadeInDuration,
      this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        closedShape: closedShape,
        closedBuilder: (BuildContext context, _) {
          return XCachedNetworkImage(
            fit: fit,
            imageUrl: url,
            width: width,
            height: height,
            fadeOutDuration: fadeOutDuration,
            fadeInDuration: fadeInDuration,
            placeholder: placeholder,
            placeholderFadeInDuration: placeholderFadeInDuration,
          );
        },
        openBuilder: openBuilder ??
            (BuildContext context, _) {
              return XInteractivePhotoViewer(
                imageUrl: bigImageUrl ?? url,
                thumbnail: thumbnail ?? url,
              );
            });
  }
}

class XInteractivePhotoViewer extends StatefulWidget {
  final String imageUrl;
  final String thumbnail;
  const XInteractivePhotoViewer({Key key, this.imageUrl, this.thumbnail})
      : super(key: key);

  @override
  _XInteractivePhotoViewerState createState() =>
      _XInteractivePhotoViewerState();
}

class _XInteractivePhotoViewerState extends State<XInteractivePhotoViewer> {
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
          children: [
            Positioned(
              top: 20,
              bottom: 20,
              left: 10,
              right: 10,
              child: PhotoView(
                enableRotation: false,
                loadingBuilder: (context, _) =>
                    CupertinoActivityIndicator(radius: 24),
                imageProvider: NetworkImage(widget.imageUrl),
              ),
            ),
            Positioned(
                right: 10,
                top: MediaQuery.of(context).padding.top,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: BColors.maskColor,
                    child: Icon(
                      BIcons.close,
                      size: 24,
                      color: BColors.whiteColor,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
