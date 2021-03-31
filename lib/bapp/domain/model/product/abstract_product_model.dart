/*
 * @Description: 抽象商品
 * @Author: iamsmiling
 * @Date: 2021-01-15 22:12:52
 * @LastEditTime: 2021-01-15 22:13:21
 */
import 'product_detail_model.dart';

abstract class AbstractProdductModel {
  int count = 1;
  double get price;
  double get widthM;
  double get heightM;
  double get heightCM;

  double get gauzePrice;

  double get accessoryPrice;

  double get sectionalBarPrice;

  double get ribouxPrice;

  double get valancePrice;

  bool get hasGauze;

  int id;

  bool isFixedHeight;

  bool isFixedWidth;

  bool isCustomSize;

  bool hasFlower;

  double doorWidth;

  double flowerSize;

  ProductSkuModel get currentSku;
}
