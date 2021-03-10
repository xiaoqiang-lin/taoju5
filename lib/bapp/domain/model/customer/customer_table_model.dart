import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/utils/json_kit.dart';

class CustomerTableModel {
  int totalCount;
  List<CustomerModel> customerList;

  CustomerTableModel.fromJson(Map json) {
    totalCount = json["total_count"];

    customerList = JsonKit.asList(json["list"])
        .map((e) => CustomerModel.fromJson(e))
        .toList();
  }
}
