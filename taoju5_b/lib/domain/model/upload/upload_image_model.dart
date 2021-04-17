import 'package:taoju5_bc/utils/json_kit.dart';

class UploadImageModel {
  String img;

  UploadImageModel.fromJson(Map json) {
    img = JsonKit.asWebUrl(json["data"]);
  }
}
