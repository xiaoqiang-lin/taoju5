/*
 * @Description: 支付
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:17:24
 * @LastEditTime: 2021-04-30 11:19:09
 */
class PayEntity {
  late String label;
  late String icon;
  late double price;
  late bool checked;

  PayEntity(
      {this.checked = false,
      required this.label,
      required this.icon,
      required this.price});
}
