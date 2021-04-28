/*
 * @Description: 地址管理逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-28 11:13:01
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/repository/mine_repository.dart';

class AddressListController
    extends BaseFutureLoadStateController<List<AddressEntity>> {
  MineRepository _repository = MineRepository();
  List<AddressEntity> addresses = [
    AddressEntity.sample(id: 1, isDefault: true),
    AddressEntity.sample(id: 2),
    AddressEntity.sample(id: 3),
    AddressEntity.sample(id: 4),
  ];

  AddressListController();

  void setDefaultAddress(bool flag, AddressEntity target) {
    if (flag) {
      addresses.forEach((e) {
        e.isDefault = e == target;
      });
    } else {}
    _repository.setDefaultAddress({"id": target.id});
  }

  void delAddress(AddressEntity target) {
    _repository.delAddress({"id": target.id});
  }

  @override
  Future<List<AddressEntity>> loadData({Map? params}) {
    return _repository.getAddressList({"page_index": 1, "page_size": 10}).then(
        (List<AddressEntity> value) {
      addresses = value;
      return value;
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
