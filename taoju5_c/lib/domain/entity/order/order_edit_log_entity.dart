/*
 * @Description: 订单工程部修改记录
 * @Author: iamsmiling
 * @Date: 2021-05-20 17:02:00
 * @LastEditTime: 2021-05-20 17:05:17
 */

class OrderEditLogEntity {
  late String content;
  late String date;
  late String createAt;

  OrderEditLogEntity.fromJson(Map json) {
    content = "安装预约时间：";
    date = "2021/06/03 12:00-13:00";
    createAt = "2020/05/05 18:25:35调整";
  }
}
