/*
 * @Description: 图片资源
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-16 15:01:08
 */
// part of R;
class CImage {
  static CImage _singleton = CImage._();
  // ignore: unused_element
  CImage._();
  factory CImage() => _singleton;

  ///首页
  final String home = "resources/images/home.png";
  final String homeActive = "resources/images/home_active.png";
  final String cart = "resources/images/cart.png";
  final String cartActive = "resources/images/cart_active.png";
  final String school = "resources/images/school.png";
  final String schoolActive = "resources/images/school_active.png";
  final String mine = "resources/images/mine.png";
  final String mineActive = "resources/images/mine_active.png";
  final String category = "resources/images/category.png";
  final String categoryActive = "resources/images/category_active.png";

  ///个人中心
  final String setting = "resources/images/setting.png";

  final String toBeMeasured = "resources/images/toBeMeasured.png";
  final String toBePaid = "resources/images/toBePaid.png";
  final String toBeSelected = "resources/images/toBeSelected.png";
  final String toBeInstalled = "resources/images/toBeInstalled.png";
  final String toBeDelivered = "resources/images/toBeDelivered.png";

  final String star = "resources/images/star.png";
  final String footprint = "resources/images/footprint.png";
  final String address = "resources/images/address.png";
  final String feedback = "resources/images/feedback.png";
  final String customerService = "resources/images/customer_service.png";

  ///通用
  final String close = "resources/images/close.png";

  ///登陆
  final String clear = "resources/images/clear.png";
  final String eyeOpen = "resources/images/eye_open.png";
  final String eyeClose = "resources/images/eye_close.png";

  ///首页
  final String factory = "resources/images/factory.png";
  final String secure = "resources/images/secure.png";
  final String lamp = "resources/images/lamp.png";
  final String diamond = "resources/images/diamond.png";

  ///是否选中
  final String checked = "resources/images/checked.png";
  final String unchecked = "resources/images/unchecked.png";

  final String next = "resources/images/next.png";

  ///定位
  final String locationAccent = "resources/images/location_accent.png";
  final String location = "resources/images/location.png";
}
