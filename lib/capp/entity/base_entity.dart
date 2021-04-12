class BaseEntity {
  int code;
  dynamic data;
  String message;

  BaseEntity.fromJson(Map json) {
    code = json["code"];
    data = json["data"];
    message = json["message"];
  }

  @override
  String toString() {
    return "BaseEntity{code:$code,data:$data,message:$message}";
  }

  bool get success => code == 0;

  bool get unAuthed => code == 999;
}
