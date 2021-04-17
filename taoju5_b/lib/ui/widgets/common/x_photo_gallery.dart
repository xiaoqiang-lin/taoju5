import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_icons.dart';

class XPhotoGallery extends StatefulWidget {
  final List<String> imageList;
  final int currentIndex;
  const XPhotoGallery(
      {Key key, @required this.imageList, this.currentIndex = 0})
      : super(key: key);

  @override
  _XPhotoGalleryState createState() => _XPhotoGalleryState();
}

class _XPhotoGalleryState extends State<XPhotoGallery> {
  int currentIndex;

  List<String> get images => widget.imageList;
  PageController controller;
  @override
  void initState() {
    currentIndex = widget.currentIndex;
    controller = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
                child: PhotoViewGallery.builder(
              pageController: controller,
              scrollPhysics: const BouncingScrollPhysics(),
              loadingBuilder: (BuildContext context, _) {
                return CupertinoActivityIndicator(
                  radius: 32,
                );
              },
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(images[index]),
                );
              },
              itemCount: images.length,
              backgroundDecoration: null,
              enableRotation: false,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )),
          ),
          Positioned(
              bottom: kBottomNavigationBarHeight,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${currentIndex + 1}/${images.length}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          images.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                    controller.animateToPage(currentIndex,
                                        duration: Duration(milliseconds: 375),
                                        curve: Curves.ease);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: CircleAvatar(
                                    foregroundColor: currentIndex == index
                                        ? Colors.white70
                                        : Colors.black54,
                                    radius: 5,
                                  ),
                                ),
                              )),
                    ),
                  ],
                ),
              )),
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
    );
  }
}
