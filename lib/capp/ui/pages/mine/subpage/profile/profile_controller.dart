/*
 * @Description: 个人资料
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-16 19:20:30
 */
import 'dart:io';

import 'package:get/get.dart';
import 'package:taoju5/capp/domain/entity/user/user_entity.dart';

import 'package:image_picker/image_picker.dart';

class CProfileController extends GetxController {
  CUserEntity user;

  CProfileController(this.user) : assert(user != null);

  Future chooseAvatar() async {
    File avatar = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(avatar);
    // final pickedImage = await picker.(source: ImageSource.camera);
  }
}
