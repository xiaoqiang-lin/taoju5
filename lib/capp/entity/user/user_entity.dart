class UserEntity {
  String name;
  String avatar;
  String account;
  int id;

  UserEntity.fromJson(Map json);

  UserEntity.smaple() {
    id = 1;
    name = "小居友-T1J23456";
    account = "13588414007";
    avatar = "https://i.loli.net/2021/04/13/t3M15Z8oQCSLAgb.png";
  }
}
