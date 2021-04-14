class AddressEntity {
  String username;
  String tel;
  String description;
  bool isDefault;

  AddressEntity.fromJson(Map json);

  AddressEntity.sample({bool isDefault = false}) {
    username = "青红造了个白";
    tel = "13588414007";
    this.isDefault = isDefault;
    description = "浙江省杭州市临平区临平乔司街道世纪大道与南苑街道交叉口华元欢乐城4幢3513-2";
  }
}
