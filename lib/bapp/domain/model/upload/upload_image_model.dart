import 'package:taoju5/utils/json_kit.dart';

class UploadImageModel {
  String img;

  UploadImageModel.fromJson(Map json) {
    img = JsonKit.asWebUrl(json["data"]);
  }
}
