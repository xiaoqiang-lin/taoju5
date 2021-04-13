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
}
