/*
 * @Description: 购物车模型
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:55:21
 * @LastEditTime: 2021-04-28 11:26:54
 */

class CartEntity {
  late int id;
  late int productId;
  late int productTypeCode;
  late String image;
  late int stock;
  late int maxPurchase;
  late int minPurchase;
  late bool offShelves;
}
