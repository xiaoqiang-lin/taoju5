/*
 * @Description:修改头像逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-22 13:24:31
 * @LastEditTime: 2021-04-22 18:47:55
 */
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/domain/entity/params/user/modify_user_profile_params.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/utils/toast.dart';

import 'dialog/image_source_picker_dialog.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

class ModifyUserAvatarController extends GetxController {
  late Widget avatar;

  @override
  void onInit() {
    assert(
        Get.parameters["avatar"] is String && Get.parameters["avatar"] != null);
    avatar = Image.network(
      Get.parameters["avatar"]!,
      width: Get.width,
    );
    super.onInit();
  }

  Future pickImage() async {
    ImageSource? source = await openImageSourcePickerDialog(Get.context!);
    if (source == null) return;
    ImagePicker picker = ImagePicker();
    PickedFile? avatar = await picker.getImage(source: source);
    await Get.toNamed(AppRoutes.imageCrop, arguments: avatar);
    if (avatar == null) return;
    return _upload(avatar);
  }

  Future? _upload(PickedFile? file) async {
    if (file == null) return null;
    Uint8List buffer = await file.readAsBytes();
    String ext = CommonKit.getFileExt(file.path);
    dio.MultipartFile multipartFile = dio.MultipartFile.fromBytes(buffer,
        filename: file.path, contentType: MediaType("image", ext));
    dio.FormData formData = dio.FormData.fromMap({"file_path": multipartFile});
    ModifyUserProfileParamsEntity arg =
        ModifyUserProfileParamsEntity(field: ModifyUserProfileField.avatar);
    arg.filePath = multipartFile;
    return modify(arg: arg, formData: formData);
  }

  Future modify(
      {required ModifyUserProfileParamsEntity arg, dynamic formData}) {
    MineRepository _repository = MineRepository();
    ToastKit.loading(message: "正在上传");
    return _repository
        .modifyUserProfile(arg.params, formData: formData)
        .then((UserEntity val) {
      avatar = Image.network(val.avatar);
    }).whenComplete(() {
      ToastKit.dismiss();
      update();
    });
  }
}
