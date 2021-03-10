import 'package:taoju5/utils/json_kit.dart';

class OrderMainfestModel {
  String clientName;
  String orderNo;
  List<ProductMainfestModel> productList;

  OrderMainfestModel.fromJson(Map json) {
    clientName = json["client_name"];
    orderNo = json["order_no"];
    productList = JsonKit.asList(json["goods_list"])
        .map((e) => ProductMainfestModel.fromJson(e))
        .toList();
  }
}

extension OrderMainfestModelKit on OrderMainfestModel {
  int get totalCount => productList?.length ?? 0;

  double get totalPrice =>
      productList.map((e) => JsonKit.asDouble(e.price)).reduce((a, b) => a + b);
}

class ProductMainfestModel {
  String status;
  int count;
  String price;
  List<ClothMaterialModel> clothList;

  ProductMainfestModel.fromJson(Map json) {
    status = json["status_name"];
    count = json["count"];
    price = json["price"];
    clothList = JsonKit.asList(json["list"])
        .map((e) => ClothMaterialModel.fromJson(e))
        .toList();
  }
}

class ClothMaterialModel {
  String value;
  String productPrice;
  String clothPrice;
  String price;
  String productName;
  String key;

  ClothMaterialModel.fromJson(Map json) {
    productName = json["goods_name"];
    value = json["material"];
    price = json["price"];
    clothPrice = json["price"];
    productPrice = json["goods_price"];
    key = json["material_name"];
  }
}
