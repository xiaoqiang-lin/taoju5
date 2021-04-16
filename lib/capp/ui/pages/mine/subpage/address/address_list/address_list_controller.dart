/*
 * @Description: 地址管理逻辑
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-16 17:52:37
 */
import 'package:get/get.dart';
import 'package:taoju5/capp/domain/entity/address/address_entity.dart';
import 'package:taoju5/capp/domain/repository/mine_api.dart';

class CAddressListController extends GetxController {
  CMineRepository _repository = CMineRepository();
  List<CAddressEntity> addresses = [
    CAddressEntity.sample(id: 1, isDefault: true),
    CAddressEntity.sample(id: 2),
    CAddressEntity.sample(id: 3),
    CAddressEntity.sample(id: 4),
  ];

  CAddressListController();

  void setDefaultAddress(bool flag, CAddressEntity target) {
    if (flag) {
      addresses.forEach((e) {
        e.isDefault = e == target;
      });
    } else {}
    _repository.setDefaultAddress({"id": target.id});
  }

  void delAddress(CAddressEntity target) {
    _repository.delAddress({"id": target.id});
  }

  Future loadData() {
    return _repository.getAddressList({"page_index": 1, "page_size": 10}).then(
        (List<CAddressEntity> value) {
      addresses = value;
      update();
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
