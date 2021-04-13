import 'package:get/get.dart';
import 'package:taoju5/capp/entity/address/address_entity.dart';

class CAddressController extends GetxController {
  List<AddressEntity> addresses = [
    AddressEntity.sample(isDefault: true),
    AddressEntity.sample(),
    AddressEntity.sample(),
    AddressEntity.sample(),
  ];

  final String userId;
  CAddressController(this.userId);
}
