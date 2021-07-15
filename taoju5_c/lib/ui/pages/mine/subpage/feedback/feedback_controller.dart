/*
 * @Description: 意见反馈逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-19 09:35:38
 * @LastEditTime: 2021-04-22 18:34:54
 */
import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/domain/entity/params/feedback/feedback_params.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';
import 'package:http_parser/http_parser.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/utils/toast.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class FeedbackController extends GetxController
    with SingleGetTickerProviderMixin {
  List<FeedbackType> feedbackTypes = [
    FeedbackType.bug,
    FeedbackType.suggestion
  ];

  late TabController tabController;

  FeedbackParamsEntity arg = FeedbackParamsEntity();
  List<Widget> images = [];

  static const int MAX_COUNT = 5;

  _listen() {
    arg.feedbackType = feedbackTypes[tabController.index];
  }

  @override
  void onInit() {
    tabController = TabController(length: feedbackTypes.length, vsync: this)
      ..addListener(_listen);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.removeListener(_listen);
    tabController.dispose();
    super.onClose();
  }

  Future pickImage() async {
    if (images.length >= MAX_COUNT) return;
    List<AssetEntity>? assets = await AssetPicker.pickAssets(
      Get.context!,
      maxAssets: MAX_COUNT,
    );
    if (assets == null) return;

    // List<Asset> assets = await MultiImagePicker.pickImages(
    //     maxImages: 5,
    //     enableCamera: true,
    //     materialOptions: MaterialOptions(
    //         allViewTitle: "所有照片", textOnNothingSelected: "暂未选中照片"));
    List<dio.MultipartFile> files = [];

    Map<String, dynamic> map = {};
    for (AssetEntity item in assets) {
      Uint8List? buffer = await item.originBytes;
      if (buffer == null) continue;
      String ext = CommonKit.getFileExt(item.id);
      dio.MultipartFile multipartFile = dio.MultipartFile.fromBytes(buffer,
          filename: item.id, contentType: MediaType("image", ext));
      images.add(Image.memory(
        buffer,
        width: R.dimen.dp56,
        height: R.dimen.dp56,
        fit: BoxFit.contain,
      ));
      update();
      files.add(multipartFile);
      for (int i = 0; i < files.length; i++) {
        map.addAll({"screentshot[$i]": files[i]});
      }
    }
    dio.FormData formData = dio.FormData.fromMap(map);
    arg.formData = formData;
  }

  void setDecription(String val) {
    arg.description = val;
  }

  void setTelephone(String val) {
    arg.telephone = val;
  }

  void delete(Widget item) {
    images.remove(item);
    update();
  }

  Future submit() {
    MineRepository repository = MineRepository();
    ToastKit.loading(message: "正在提交");

    return repository
        .feedback(params: arg.params, formData: arg.formData)
        .whenComplete(() {
      ToastKit.dismiss();
      Get.back();
    });
  }
}