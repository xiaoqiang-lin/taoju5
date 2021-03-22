class UserProtocolModel {
  String title;
  String content;

  UserProtocolModel.fromJson(Map json) {
    title = json["title"];
    content = json["content"];
  }
}
