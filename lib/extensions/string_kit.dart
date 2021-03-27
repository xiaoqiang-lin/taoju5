import 'dart:convert';

extension StringKit on String {
  ///字符串编码
  String stringEncode() {
    return jsonEncode(Utf8Encoder().convert(this));
  }

  ///字符串解码
  String stringDecode() {
    var list = List<int>();

    ///字符串解码
    jsonDecode(this).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
