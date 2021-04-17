/*
 * @Description: 修改订单价格模型
 * @Author: iamsmiling
 * @Date: 2021-01-14 16:47:13
 * @LastEditTime: 2021-01-14 18:07:47
 */
class OrderPriceModel {
  String balance;
  String deltaPrice;
  String modifyPriceNote;
  String payAmount;

  OrderPriceModel.fromJson(Map json) {
    balance = json["tail_money"];
    deltaPrice = json["adjust_money"];
    payAmount = json["reality_pay_money"];
    modifyPriceNote = json["adjust_money_remark"];
  }
}
