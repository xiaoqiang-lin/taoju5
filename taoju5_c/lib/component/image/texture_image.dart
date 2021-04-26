/*
 * @Description: 筒鼓外接纹理显示图片
 * @Author: iamsmiling
 * @Date: 2021-04-24 18:42:16
 * @LastEditTime: 2021-04-25 22:39:15
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextureImage extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;

  TextureImage({Key? key, required this.url, this.height, this.width})
      : super(key: key);

  @override
  _TextureImageState createState() => _TextureImageState();
}

class _TextureImageState extends State<TextureImage> {
  int? _textureId;
  final MethodChannel _channel = MethodChannel("com.buyi.taoju5.fresco");

  double? _width;
  double? _height;
  @override
  void initState() {
    super.initState();
    _initFresco();
  }

  _initFresco() {
    print("=======${widget.url}url");

    _channel.invokeMethod("loadImage", {"url": widget.url}).then((value) {
      print(value);
      print("这个出错出错");
      print(value is Map);
      if (value is Map) {
        _textureId = value["textureId"];
        _width = double.parse(value["width"]);
        _height = double.parse(value["height"]);
      }
    }).catchError((err) {
      print("出错啦啦啦啦啦");
    }).whenComplete(() {
      print("一直没有返回结果");
      setState(() {});
    });
  }

  @override
  void dispose() {
    _channel.invokeMethod("release", {"url": widget.url});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: widget.height,
      child: _textureId == null
          ? Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: Text("_texttureId还未获取"),
            )
          : Texture(textureId: _textureId!),
    );
  }
}
