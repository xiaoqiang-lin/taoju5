import 'package:get/get.dart';
import 'package:taoju5/capp/entity/user/user_entity.dart';

class CProfileController extends GetxController {
  UserEntity user;

  CProfileController(this.user) : assert(user != null);
}
