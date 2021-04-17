import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class XCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  /// The duration of the fade-out animation for the [placeholder].
  final Duration fadeOutDuration;

  /// The curve of the fade-out animation for the [placeholder].
  final Curve fadeOutCurve;

  /// The duration of the fade-in animation for the [imageUrl].
  final Duration fadeInDuration;

  /// Widget displayed while the target [imageUrl] is loading.
  final PlaceholderWidgetBuilder placeholder;

  final Duration placeholderFadeInDuration;
  const XCachedNetworkImage(
      {Key key,
      @required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.placeholder,
      this.fadeOutDuration = const Duration(milliseconds: 0),
      this.fadeOutCurve,
      this.fadeInDuration = const Duration(milliseconds: 0),
      this.placeholderFadeInDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: fadeInDuration ?? Duration(milliseconds: 50),
      fadeOutDuration: fadeOutDuration ?? Duration(milliseconds: 50),
      placeholderFadeInDuration: placeholderFadeInDuration,
      errorWidget: (BuildContext context, _, __) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/placeholder_img.jpg"));
      },
      placeholder: placeholder ??
          (BuildContext context, _) {
            return Image.asset("assets/images/placeholder_img.jpg");
          },
    );
  }
}
