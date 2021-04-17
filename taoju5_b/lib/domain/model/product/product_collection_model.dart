import 'package:taoju5_bc/utils/json_kit.dart';

class ProductCollectionModel {
  String productName;
  int productId;
  String categoryName;
  String image;
  double productPrice;

  ProductCollectionModel.fromJson(Map json) {
    productName = json["goods_name"];
    productId = json["goods_id"];
    categoryName = json["category_name"];
    image = JsonKit.asWebUrl(json["goods_image"]);
    productPrice = JsonKit.asDouble(json["price"]);
  }
}
