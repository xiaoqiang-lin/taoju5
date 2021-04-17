/*
 * @Descripon: app页面
 * @Author: iamsmiling
 * @Date: 2020-12-18 16:11:26
 * @LastEditTime: 2021-04-17 17:29:56
 */

import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/after_sell/after_sell_binding.dart';
import 'package:taoju5_b/ui/pages/after_sell/after_sell_page.dart';
import 'package:taoju5_b/ui/pages/customer/customer_address_edit/customer_address_edit_binding.dart';
import 'package:taoju5_b/ui/pages/customer/customer_address_edit/customer_address_eidt_page.dart';
import 'package:taoju5_b/ui/pages/customer/customer_detail/customer_detail_binding.dart';
import 'package:taoju5_b/ui/pages/customer/customer_detail/customer_detail_page.dart';
import 'package:taoju5_b/ui/pages/customer/customer_edit/customer_edit_binding.dart';
import 'package:taoju5_b/ui/pages/customer/customer_edit/customer_edit_page.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_binding.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_page.dart';
import 'package:taoju5_b/ui/pages/customer/customer_refund/customer_refund_binding.dart';
import 'package:taoju5_b/ui/pages/customer/customer_refund/customer_refund_page.dart';
import 'package:taoju5_b/ui/pages/customer/customer_table/customer_table_binding.dart';
import 'package:taoju5_b/ui/pages/customer/customer_table/customer_table_page.dart';
import 'package:taoju5_b/ui/pages/dashboard/data_dash_board_binding.dart';
import 'package:taoju5_b/ui/pages/dashboard/data_dash_board_page.dart';
import 'package:taoju5_b/ui/pages/home/home_page.dart';
import 'package:taoju5_b/ui/pages/login/forget_pwd/forget_password_binding.dart';
import 'package:taoju5_b/ui/pages/login/forget_pwd/forget_password_page.dart';
import 'package:taoju5_b/ui/pages/login/login/login_binding.dart';
import 'package:taoju5_b/ui/pages/login/login/login_page.dart';
import 'package:taoju5_b/ui/pages/login/modify_pwd/modify_password_binding.dart';
import 'package:taoju5_b/ui/pages/login/modify_pwd/modify_pwd_page.dart';
import 'package:taoju5_b/ui/pages/login/reset_pwd/reset_pwd_binding.dart';
import 'package:taoju5_b/ui/pages/login/reset_pwd/reset_pwd_page.dart';
import 'package:taoju5_b/ui/pages/not_found_404/not_found_404_page.dart';
import 'package:taoju5_b/ui/pages/order/commit_order/commit_order_binding.dart';
import 'package:taoju5_b/ui/pages/order/commit_order/commit_order_page.dart';
import 'package:taoju5_b/ui/pages/order/commit_order_success/commit_order_success_page.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_binding.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_page.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/logistics/order_logistics_binding.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/logistics/order_logistics_page.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_binding.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_page.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_binding.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_edit_page.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_page.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/order_log/order_log_binding.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/subpage/order_log/order_log_page.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_binding.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_page.dart';
import 'package:taoju5_b/ui/pages/product/cart/cart_binding.dart';
import 'package:taoju5_b/ui/pages/product/cart/cart_page.dart';
import 'package:taoju5_b/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_binding.dart';
import 'package:taoju5_b/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_page.dart';
import 'package:taoju5_b/ui/pages/product/collection/collection_binding.dart';
import 'package:taoju5_b/ui/pages/product/collection/collection_page.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_binding.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_binding.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_page.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_binding.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_page.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/measure_data/edit_measure_data_page.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/measure_data/eidt_measure_data_binding.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/product_share/product_share_binding.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/subpage/product_share/product_share_page.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_page.dart';
import 'package:taoju5_b/ui/pages/product/product_list/product_list_binding.dart';
import 'package:taoju5_b/ui/pages/product/product_list/product_list_page.dart';
import 'package:taoju5_b/ui/pages/product/selectable_product_list/selectable_product_list_binding.dart';
import 'package:taoju5_b/ui/pages/product/selectable_product_list/selectable_product_list_page.dart';
import 'package:taoju5_b/ui/pages/scan_qrcode/scan_qrcode_binding.dart';
import 'package:taoju5_b/ui/pages/scan_qrcode/scan_qrcode_page.dart';
import 'package:taoju5_b/ui/pages/search/search_binding.dart';
import 'package:taoju5_b/ui/pages/search/search_page.dart';
import 'package:taoju5_b/ui/pages/search/subpage/customer_search/customer_search_binding.dart';
import 'package:taoju5_b/ui/pages/search/subpage/customer_search/customer_search_page.dart';
import 'package:taoju5_b/ui/pages/search/subpage/order_search/order_search_binding.dart';
import 'package:taoju5_b/ui/pages/search/subpage/order_search/order_search_page.dart';
import 'package:taoju5_b/ui/pages/setting/app_version/app_version_page.dart';
import 'package:taoju5_b/ui/pages/setting/feed_back/feed_back_binding.dart';
import 'package:taoju5_b/ui/pages/setting/feed_back/feed_back_page.dart';
import 'package:taoju5_b/ui/pages/setting/setting/setting_binding.dart';
import 'package:taoju5_b/ui/pages/setting/setting/setting_page.dart';
import 'package:taoju5_b/ui/pages/user_protocol/user_protocol_binding.dart';
import 'package:taoju5_b/ui/pages/user_protocol/user_protocol_page.dart';
import 'package:taoju5_bc/storage/storage_manager.dart';

part 'bapp_routes.dart';

class BAppPages {
  static get initial {
    return !GetUtils.isNullOrBlank(
            StorageManager().sharedPreferences?.getString("token"))
        ? BAppRoutes.home
        : BAppRoutes.login;
  }

  static final unkonw =
      GetPage(name: BAppRoutes.unkonw, page: () => NotFound404Page());

  static final pages = [
    GetPage(
      name: BAppRoutes.home,
      page: () => HomePage(),
    ),

    ///登陆相关
    GetPage(
        name: BAppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),

    GetPage(
        name: BAppRoutes.resetPassword,
        page: () => ResetPwdPage(),
        binding: ResetPwdBinding()),

    GetPage(
        name: BAppRoutes.forgetPassword,
        page: () => ForgetPasswrdPage(),
        binding: ForgetPasswordBinding()),

    GetPage(
        name: BAppRoutes.modifyPassword,
        page: () => ModifyPasswordPage(),
        binding: ModifyPasswordBinding()),

    ///商品相关
    GetPage(
        name: BAppRoutes.productList,
        page: () => ProductListPage(),
        binding: ProductListBinding()),
    GetPage(
      name: BAppRoutes.productDetail + "/:id",
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

    GetPage(
      name: BAppRoutes.webProductDetail + "/:id",
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

    GetPage(
        name: BAppRoutes.productShare + "/:id/:token",
        page: () => ProductSharePage(),
        binding: ProductShareBinding()),

    GetPage(
        name: BAppRoutes.selectableProductList,
        page: () => SelectableProductListPage(),
        binding: SelectableProductListBinding()),

    ///场景
    GetPage(
        name: BAppRoutes.sceneProductDetail,
        page: () => SceneProductDetailPage(),
        binding: SceneProductDetailBinding()),

    ///软装方案
    GetPage(
        name: BAppRoutes.softProductDetail,
        page: () => SoftProductDetailPage(),
        binding: SoftProductDetailBinding()),

    ///购物车页面
    GetPage(
        name: BAppRoutes.cart + "/:customerId",
        page: () => CartPage(),
        binding: CartBinding()),

    ///修改购物车里面的商品属性
    GetPage(
        name: BAppRoutes.modifyCurtainProductAttr,
        page: () => ModifyCurtainProductAttrPage(),
        binding: ModifyCurtainProductAttrBinding()),

    ///填写测装数据
    GetPage(
        name: BAppRoutes.editMeasureData + "/:id",
        page: () => EditMeasureDataPage(),
        binding: EditMeasureDataBinding()),

    ///客户相关
    GetPage(
        name: BAppRoutes.customerList,
        page: () => CustomerListPage(),
        binding: CustomerListBinding()),
    GetPage(
        name: BAppRoutes.categoryCustomerList,
        page: () => CustomerTablePage(),
        binding: CustomerTableBinding()),
    GetPage(
        name: BAppRoutes.customerDetail + "/:id",
        page: () => CustomerDetailPage(),
        binding: CustomerDetailBinding()),
    GetPage(
        name: BAppRoutes.customerEdit,
        page: () => CustomerEditPage(),
        binding: CustomerEditBinding()),

    ///订单相关
    GetPage(
        name: BAppRoutes.orderList,
        page: () => OrderListPage(),
        binding: OrderListBinding()),

    ///订单详情
    GetPage(
        name: BAppRoutes.orderDetail + "/:id",
        page: () => OrderDetailPage(),
        binding: OrderDetailBinding(),
        children: []),

    ///订单物流
    GetPage(
        name: BAppRoutes.orderLogistics + "/:id",
        page: () => OrderLogisticsPage(),
        binding: OrderLogisticsBinding()),

    ///商品清单
    GetPage(
        name: BAppRoutes.orderMainfest + "/:id",
        page: () => OrderMainfestPage(),
        binding: OrderMainfestBinding()),

    ///订单日志
    GetPage(
        name: BAppRoutes.orderLog + "/:id",
        page: () => OrderLogPage(),
        binding: OrderLogBinding()),

    ///测装数据
    GetPage(
        name: BAppRoutes.orderMeasureData,
        page: () => OrderMeasureDataPage(),
        binding: OrderMeasureDataBinding()),

    /// 修改打开方式
    GetPage(
        name: BAppRoutes.orderMeasureDataEdit + "/:id",
        page: () => OrderMeasureDataEditPage(),
        binding: OrderMeasureDataBinding()),

    GetPage(
        name: BAppRoutes.commitOrder,
        page: () => CommitOrderPage(),
        binding: CommitOrderBinding()),
    GetPage(
        name: BAppRoutes.commitOrderSuccess,
        page: () => CommitOrderSuccessPage()),

    GetPage(
        name: BAppRoutes.customerAddressEdit + "/:id",
        page: () => CustomerAddressEditPage(),
        binding: CustomerAddressEditBinding()),

    ///设置相关
    GetPage(
        name: BAppRoutes.setting,
        page: () => SettingPage(),
        binding: SettngBinding()),
    GetPage(
        name: BAppRoutes.feedback,
        page: () => FeedBackPage(),
        binding: FeedBackBinding()),

    ///数据中心
    GetPage(
        name: BAppRoutes.dashBoard,
        page: () => DataDashBoardPage(),
        binding: DataDashBoardBinding()),

    ///搜索页面
    GetPage(
        name: BAppRoutes.search,
        page: () => SearchPage(),
        binding: SeacrhBinding()),

    ///搜藏夹
    GetPage(
        name: BAppRoutes.collection + "/:id",
        page: () => CollectionPage(),
        binding: CollectionBinding()),

    ///用户协议
    GetPage(
        name: BAppRoutes.userProtocol,
        page: () => UserProtocolPage(),
        binding: UserProtocolBinding()),

    ///app版本号
    GetPage(name: BAppRoutes.appVersion, page: () => AppVersionPage()),

    //售后服务
    GetPage(
        name: BAppRoutes.afterSell + "/:id",
        page: () => AfterSellPage(),
        binding: AfterSellBinding()),

    ///扫描二维码
    GetPage(
        name: BAppRoutes.scanQRCode,
        page: () => ScanQRCodePage(),
        binding: ScanQRCodeBinding()),

    ///客户退单
    GetPage(
        name: BAppRoutes.customerRefund,
        page: () => CustomerRefundPage(),
        binding: CustomerRefundBinding()),

    /// 搜索客户
    GetPage(
        name: BAppRoutes.searchCustomer,
        page: () => CustomerSearchPage(),
        binding: CustomerSearchBinding()),

    /// 搜索订单
    GetPage(
        name: BAppRoutes.searchOrder,
        page: () => OrderSearchPage(),
        binding: OrderSearchBinding())
  ];
}
