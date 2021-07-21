/*
 * @Description: 上传图片按钮
 * @Author: iamsmiling
 * @Date: 2021-04-19 11:37:51
 * @LastEditTime: 2021-07-16 10:47:14
 */
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class UploadImageController extends GetxController {
  late int maxCount;
  UploadImageController({this.maxCount = 5});
  List<Widget> images = [];
  late Map formData = {};

  Future pickImage() async {
    if (images.length >= maxCount) return null;
    List<AssetEntity>? assets = await AssetPicker.pickAssets(
      Get.context!,
      maxAssets: maxCount - images.length,
    );
    if (assets == null) return null;

    // List<Asset> assets = await MultiImagePicker.pickImages(
    //     maxImages: 5,
    //     enableCamera: true,
    //     materialOptions: MaterialOptions(
    //         allViewTitle: "所有照片", textOnNothingSelected: "暂未选中照片"));
    Map<String, dynamic> map = {};
    for (AssetEntity item in assets) {
      Uint8List? buffer = await item.originBytes;
      map["screenshot[${assets.indexOf(item)}]"] =
          base64Encode(buffer?.toList() ?? []);
      if (buffer == null) continue;
      images.add(Image.memory(
        buffer,
        width: R.dimen.dp56,
        height: R.dimen.dp56,
        fit: BoxFit.contain,
      ));
      update();
    }

    formData = map;
    return formData;
  }

  void delete(Widget item) {
    images.remove(item);
    update();
  }
}

class UploadImageButton extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  const UploadImageButton({
    Key? key,
    this.color = const Color(0xfff5f5f5),
    this.width = 56,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadImageController>(
        init: UploadImageController(),
        builder: (_) {
          return Container(
            child: Wrap(
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(
                      left: R.dimen.dp10,
                      right: R.dimen.dp10,
                      bottom: R.dimen.dp10,
                      top: R.dimen.dp10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(R.dimen.sp7),
                      color: color),
                  child: Wrap(
                    spacing: R.dimen.dp7,
                    runSpacing: R.dimen.dp7,
                    children: [
                      for (Widget item in _.images)
                        Stack(
                          children: [
                            Container(
                                width: width,
                                height: height,
                                margin: EdgeInsets.only(top: 7, right: 0),
                                child: item),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                    onTap: () => _.delete(item),
                                    child: Image.asset(
                                      R.image.delete,
                                    )))
                          ],
                        ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(
                            maxHeight: height,
                            minHeight: height,
                            minWidth: width,
                            maxWidth: width),
                        onPressed: _.pickImage,
                        icon: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border:
                                  Border.all(color: const Color(0xFFB4B4B4))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("resources/images/camera.png"),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text(
                                  "上传照片",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      height: 1,
                                      fontSize: 8,
                                      color: Color(0xFF999999)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text(
                                  "(最多五张)",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      height: .98,
                                      fontSize: 8,
                                      color: Color(0xFF999999)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
