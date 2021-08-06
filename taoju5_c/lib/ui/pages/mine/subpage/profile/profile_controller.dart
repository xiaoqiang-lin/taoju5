/*
 * @Description: 个人资料
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-08-05 13:44:33
 */
import 'dart:typed_data';

import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/picker/date_picker.dart';
import 'package:taoju5_c/component/picker/gender_picker.dart';
import 'package:taoju5_c/domain/entity/params/user/modify_user_profile_params.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:taoju5_c/domain/repository/mine_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'modal/choose_image_source_modal.dart';
import 'package:http_parser/http_parser.dart';

class ProfileController extends GetxController {
  UserEntity user;
  late ModifyUserProfileParamsEntity arg;
  ProfileController(this.user) {
    arg = ModifyUserProfileParamsEntity.fromUserEntity(user);
  }

  Future chooseAvatar() async {
    ImageSource? source = await chooseImageSourceModal(Get.context!);
    if (source == null) return;
    ImagePicker picker = ImagePicker();
    PickedFile? avatar = await picker.getImage(source: source);

    _upload(avatar);
  }

  Future? _upload(PickedFile? file) async {
    if (file == null) return null;
    Uint8List buffer = await file.readAsBytes();
    String ext = CommonKit.getFileExt(file.path);
    dio.MultipartFile multipartFile = dio.MultipartFile.fromBytes(buffer,
        filename: file.path, contentType: MediaType("image", ext));
    dio.FormData formData = dio.FormData.fromMap({"file_path": multipartFile});
    arg.filePath = multipartFile;
    return modify(field: ModifyUserProfileField.avatar, formData: formData);
  }

  Future modify({required ModifyUserProfileField? field, dynamic formData}) {
    MineRepository _repository = MineRepository();
    arg.field = field;
    return _repository
        .modifyUserProfile(arg.params, formData: formData)
        .then((UserEntity val) {
      user = val;
      update();
    });
  }

  void setNickname(String val) {
    arg.nickname = val;
  }

  void setGender() {
    openGenderPicker(Get.context!).then((Gender? val) {
      if (val == null) {
        return;
      }
      arg.gender = val;
      modify(field: ModifyUserProfileField.gender);
    });
  }

  void setBirthday() {
    openDatePicker(Get.context!).then((value) {
      print(value);
    });
  }

  void setAvatar() {
    Get.toNamed(AppRoutes.mine + AppRoutes.profile + AppRoutes.modifyUserAvatar,
        parameters: {"avatar": user.avatar})?.then((value) {
      user.avatar = value;
      update();
    });
  }
}
