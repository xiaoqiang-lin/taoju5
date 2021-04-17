/*
 * @Description: 性别
 * @Author: iamsmiling
 * @Date: 2021-01-11 09:51:11
 * @LastEditTime: 2021-01-11 11:29:35
 */
/// 性别选项
///
enum XGender { unknown, male, female }

extension XGenderKit on XGender {
  String stringify([XGender value]) => getGenderName(this);
}

String getGenderName(XGender gender) {
  Map<XGender, String> map = const {
    XGender.unknown: "未知",
    XGender.male: "男",
    XGender.female: "女"
  };
  return map[gender] ?? map[XGender.unknown];
}

int getGenderId(XGender gender) {
  return gender.index;
}

int getGenderIdByName(String name) {
  Map<String, XGender> map = const {
    "未知": XGender.unknown,
    "男": XGender.male,
    "女": XGender.female,
  };
  XGender gender = map[name] ?? map["未知"];
  return gender.index;
}

XGender getGenderById(int id) {
  return XGender.values.firstWhere((e) => e.index == id);
}
