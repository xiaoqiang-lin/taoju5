/*
 * @Description: 地址管理逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-06-03 14:27:40
 */
import 'dart:convert';

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';
import 'package:taoju5_c/local_storage/local_storage.dart';

class AddressListController
    extends BaseFutureLoadStateController<List<AddressEntity>> {
  MineRepository _repository = MineRepository();
  List<AddressEntity> addresses = [];

  AddressListController();

  void setDefaultAddress(bool flag, AddressEntity target) {
    if (flag) {
      addresses.forEach((e) {
        e.isDefault = e == target;
      });
    } else {}
    _repository.setDefaultAddress({"id": target.id}).then((value) {
      addresses = value;
    }).whenComplete(update);
  }

  void delAddress(AddressEntity target) {
    _repository.delAddress({"id": target.id}).then((value) {
      addresses = value;
    }).whenComplete(update);
  }

  @override
  Future<List<AddressEntity>> loadData({Map? params}) {
    return _repository.getAddressList({"page_index": 1, "page_size": 10}).then(
        (List<AddressEntity> value) {
      addresses = value;
      return value;
    });
  }

  AddressEntity? get defaultAddress {
    if (addresses.isEmpty) return null;
    for (int i = 0; i < addresses.length; i++) {
      AddressEntity item = addresses[i];
      if (item.isDefault) {
        LocalStorage.save("defaultAddress", jsonEncode(item.toJson()));
        return item;
      }
    }
    return null;
  }
}
