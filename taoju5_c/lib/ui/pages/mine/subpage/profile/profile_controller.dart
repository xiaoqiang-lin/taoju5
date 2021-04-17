/*
 * @Description: 个人资料
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-17 18:30:37
 */
import 'dart:io';

import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';

import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  UserEntity user;

  ProfileController(this.user) : assert(user != null);

  Future chooseAvatar() async {
    File avatar = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(avatar);
    // final pickedImage = await picker.(source: ImageSource.camera);
  }
}
