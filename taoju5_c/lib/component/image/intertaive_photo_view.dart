/*
 * @Description: 大图预览
 * @Author: iamsmiling
 * @Date: 2021-04-21 16:31:31
 * @LastEditTime: 2021-04-22 10:03:18
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class InteractivePhotoView extends StatelessWidget {
  final String imageUrl;
  const InteractivePhotoView({Key? key, required this.imageUrl})
      : super(key: key);

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
                imageProvider: NetworkImage(imageUrl),
                errorBuilder: (BuildContext context, _, __) {
                  return Image.asset("resources/images/image_error.png");
                },
              ),
            ),
            Positioned(
                right: 10,
                top: MediaQuery.of(context).padding.top,
                child: GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black38,
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
