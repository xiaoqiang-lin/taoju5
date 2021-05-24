/*
 * @Description: 订单消息
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:23:23
 * @LastEditTime: 2021-05-19 16:39:51
 */
class OrderMessageEntity {
  late String status;
  late String date;
  late String image;
  late List<OrderMessageDescriptionEntity> desc;
  late String no;

  OrderMessageEntity.fromJson(Map json);

  OrderMessageEntity.sample() {
    status = "订单已测量";
    date = "13:26";
    image = "https://i.loli.net/2021/04/15/AQdINn9CJXDilPU.png";
    desc = [
      OrderMessageDescriptionEntity("您的订单已测量，请及时"),
      OrderMessageDescriptionEntity("去支付尾款", highlighted: true)
    ];
    no = "1234567888798";
  }
}

class OrderMessageDescriptionEntity {
  late String text;
  late bool highlighted;

  OrderMessageDescriptionEntity.fromJson(Map json);

  OrderMessageDescriptionEntity(this.text, {this.highlighted = false});
}
