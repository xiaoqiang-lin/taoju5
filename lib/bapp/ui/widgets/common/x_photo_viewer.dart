/*
 * @Description: 可预览的图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:17:49
 * @LastEditTime: 2021-02-20 12:34:56
 */

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class XPhotoViewer extends StatelessWidget {
  final String url;
  final String bigImageUrl;
  final BoxFit fit;
  const XPhotoViewer({Key key, @required this.url, this.bigImageUrl, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        closedBuilder: (BuildContext context, _) {
          return CachedNetworkImage(fit: fit, imageUrl: url);
        },
        openBuilder: (BuildContext context, _) {
          return XInteractivePhotoViewer(
            imageUrl: bigImageUrl ?? url,
          );
        });
  }
}

class XInteractivePhotoViewer extends StatefulWidget {
  final String imageUrl;
  const XInteractivePhotoViewer({Key key, this.imageUrl}) : super(key: key);

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
                loadingBuilder: (context, _) => CupertinoActivityIndicator(
                  radius: 24,
                ),
                imageProvider: NetworkImage(widget.imageUrl),
              ),
            ),
            Positioned(
                right: 10,
                top: MediaQuery.of(context).padding.top,
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })),
          ],
        ),
      ),
    );
  }
}
