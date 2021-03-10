/*
 * @Description: app页面
 * @Author: iamsmiling
 * @Date: 2020-12-18 16:11:26
 * @LastEditTime: 2021-02-19 22:19:57
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/after_sell/after_sell_binding.dart';
import 'package:taoju5/bapp/ui/pages/after_sell/after_sell_page.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_address_edit/customer_address_edit_binding.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_address_edit/customer_address_eidt_page.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_binding.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_page.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_edit/customer_edit_binding.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_edit/customer_edit_page.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_binding.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_page.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_table/customer_table_binding.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_table/customer_table_page.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/data_dash_board_binding.dart';
import 'package:taoju5/bapp/ui/pages/dashboard/data_dash_board_page.dart';
import 'package:taoju5/bapp/ui/pages/home/home_page.dart';
import 'package:taoju5/bapp/ui/pages/login/login/login_binding.dart';
import 'package:taoju5/bapp/ui/pages/login/login/login_page.dart';
import 'package:taoju5/bapp/ui/pages/login/reset_pwd/reset_pwd_binding.dart';
import 'package:taoju5/bapp/ui/pages/login/reset_pwd/reset_pwd_page.dart';
import 'package:taoju5/bapp/ui/pages/not_found_404/not_found_404_page.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_page.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order_success/commit_order_success_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/order_logistics_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/order_logistics_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_edit_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/order_log/order_log_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/order_log/order_log_page.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/order_list_binding.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/order_list_page.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_page.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_page.dart';
import 'package:taoju5/bapp/ui/pages/product/collection/collection_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/collection/collection_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/measure_data/edit_measure_data_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/product_share/product_share_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/product_share/product_share_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_page.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_page.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_binding.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_page.dart';
import 'package:taoju5/bapp/ui/pages/scan_qrcode/scan_qrcode_binding.dart';
import 'package:taoju5/bapp/ui/pages/scan_qrcode/scan_qrcode_page.dart';
import 'package:taoju5/bapp/ui/pages/search/search_binding.dart';
import 'package:taoju5/bapp/ui/pages/search/search_page.dart';
import 'package:taoju5/bapp/ui/pages/setting/app_version/app_version_page.dart';
import 'package:taoju5/bapp/ui/pages/setting/feed_back/feed_back_binding.dart';
import 'package:taoju5/bapp/ui/pages/setting/feed_back/feed_back_page.dart';
import 'package:taoju5/bapp/ui/pages/setting/setting/setting_binding.dart';
import 'package:taoju5/bapp/ui/pages/setting/setting/setting_page.dart';
import 'package:taoju5/bapp/ui/pages/user_protocol/user_protocol_page.dart';
import 'package:taoju5/bc-app/ui/pages/debug/debug_binding.dart';
import 'package:taoju5/bc-app/ui/pages/debug/debug_page.dart';
import 'package:taoju5/storage/storage_manager.dart';

part 'bapp_routes.dart';

class BAppPages {
  static get initial => GetUtils.isNullOrBlank(
          StorageManager().sharedPreferences?.getString("token"))
      ? BAppRoutes.home
      : BAppRoutes.home;

  static final unkonw =
      GetPage(name: BAppRoutes.unkonw, page: () => NotFound404Page());

  static final pages = [
    GetPage(
      name: BAppRoutes.home,
      page: () => HomePage(),
    ),

    GetPage(
        name: BAppRoutes.debug,
        page: () => DebugEnvPage(),
        binding: DebugBinding()),

    ///登陆相关
    GetPage(
        name: BAppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),

    GetPage(
        name: BAppRoutes.resetPassword,
        page: () => ResetPwdPage(),
        binding: ResetPwdBinding()),

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
        name: BAppRoutes.productShare + "/:id/:token",
        page: () => ProductSharePage(),
        binding: ProductShareBinding()),

    GetPage(
        name: BAppRoutes.selectableProductList,
        page: () => SelectableProductListPage(),
        binding: SelectableProductListBinding()),

    ///场景
    GetPage(
        name: BAppRoutes.sceneProductDetail + "/:id",
        page: () => SceneProductDetailPage(),
        binding: SceneProductDetailBinding()),

    ///软装方案
    GetPage(
        name: BAppRoutes.softProductDetail + "/:id",
        page: () => SoftProductDetailPage(),
        binding: SoftProductDetailBinding()),

    ///购物车页面
    GetPage(
        name: BAppRoutes.cart + "/:customerId",
        page: () => CartPage(),
        binding: CartBinding()),

    ///修改购物车里面的商品属性
    GetPage(
        name: BAppRoutes.modifyCurtainProductAttr + "/:id/:tab",
        page: () => ModifyCurtainProductAttrPage(),
        binding: ModifyCurtainProductAttrBinding()),

    ///填写测装数据
    GetPage(
      name: BAppRoutes.editMeasureData + "/:id",
      page: () => EditMeasureDataPage(),
    ),

    ///客户相关
    GetPage(
        name: BAppRoutes.customerList,
        page: () => CustomerListPage(),
        binding: CustomerListBinding()),
    GetPage(
        name: BAppRoutes.categoryCustomerList + "/:category",
        page: () => CustomerTablePage(),
        binding: CustomerTableBinding()),
    GetPage(
        name: BAppRoutes.customerDetail + "/:id",
        page: () => CustomerDetailPage(),
        binding: CustomerDetailBinding()),
    GetPage(
        name: BAppRoutes.customerEdit + "/:canChoose",
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
        name: BAppRoutes.orderMeasureData + "/:id",
        page: () => OrderMeasureDataPage(),
        binding: OrderMeasureDataBinding()),

    /// 修改打开方式
    GetPage(
        name: BAppRoutes.orderMeasureDataEdit + "/:id",
        page: () => OrderMeasureDataEditPage(),
        binding: OrderMeasureDataBinding()),

    GetPage(
        name: BAppRoutes.commitOrder + "/:orderType",
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
        name: BAppRoutes.collection,
        page: () => CollectionPage(),
        binding: CollectionBinding()),

    ///用户协议
    GetPage(name: BAppRoutes.userProtocol, page: () => UserProtocolPage()),

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
        binding: ScanQRCodeBinding())
  ];
}
