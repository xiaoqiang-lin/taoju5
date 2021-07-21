/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 22:39:50
 * @LastEditTime: 2021-07-21 15:53:12
 */

import 'package:get/get.dart';
import 'package:taoju5_c/routes/middleware/product_detail/product_browse_middleware.dart';
import 'package:taoju5_c/ui/pages/article/article_detail_binding.dart';
import 'package:taoju5_c/ui/pages/article/article_detail_page.dart';
import 'package:taoju5_c/ui/pages/cart/cart_binding.dart';
import 'package:taoju5_c/ui/pages/cart/cart_page.dart';
import 'package:taoju5_c/ui/pages/category/category_binding.dart';
import 'package:taoju5_c/ui/pages/category/category_page.dart';
import 'package:taoju5_c/ui/pages/image_crop/image_crop_binding.dart';
import 'package:taoju5_c/ui/pages/image_crop/image_crop_page.dart';
import 'package:taoju5_c/ui/pages/login/bind_telephone/bind_telephone_binding.dart';
import 'package:taoju5_c/ui/pages/login/bind_telephone/bind_telephone_page.dart';
import 'package:taoju5_c/ui/pages/login/bussiness_login/business_login_binding.dart';
import 'package:taoju5_c/ui/pages/login/bussiness_login/business_password_login_page.dart';
import 'package:taoju5_c/ui/pages/login/bussiness_login/business_sms_login_page.dart';
import 'package:taoju5_c/ui/pages/login/customer_login/customer_login_binding.dart';
import 'package:taoju5_c/ui/pages/login/customer_login/customer_password_login_page.dart';
import 'package:taoju5_c/ui/pages/login/customer_login/customer_sms_login_page.dart';
import 'package:taoju5_c/ui/pages/login/guide/login_guide_binding.dart';
import 'package:taoju5_c/ui/pages/login/guide/login_guide_page.dart';
import 'package:taoju5_c/ui/pages/login/modify_password/modify_password_binding.dart';
import 'package:taoju5_c/ui/pages/login/modify_password/modify_password_first_page.dart';
import 'package:taoju5_c/ui/pages/login/modify_password/modify_password_second_page.dart';
import 'package:taoju5_c/ui/pages/login/modify_telephone/modify_telephone_binding.dart';
import 'package:taoju5_c/ui/pages/login/modify_telephone/modify_telephone_fisrt_page.dart';
import 'package:taoju5_c/ui/pages/login/modify_telephone/modify_telephone_second_page.dart';
import 'package:taoju5_c/ui/pages/login/set_password/set_password_binding.dart';
import 'package:taoju5_c/ui/pages/login/set_password/set_password_page.dart';
import 'package:taoju5_c/ui/pages/main/main_binding.dart';
import 'package:taoju5_c/ui/pages/main/main_page.dart';
import 'package:taoju5_c/ui/pages/message/message_binding.dart';
import 'package:taoju5_c/ui/pages/message/message_page.dart';
import 'package:taoju5_c/ui/pages/message/subpage/activity_message/activity_message_binding.dart';
import 'package:taoju5_c/ui/pages/message/subpage/activity_message/activity_message_page.dart';
import 'package:taoju5_c/ui/pages/message/subpage/order_message_detail/order_message_detail_binding.dart';
import 'package:taoju5_c/ui/pages/message/subpage/order_message_detail/order_message_detail_page.dart';
import 'package:taoju5_c/ui/pages/mine/mine_binding.dart';
import 'package:taoju5_c/ui/pages/mine/mine_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/account/account_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/account/account_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/address_edit_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/address_edit_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/subpage/location/location_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/subpage/location/location_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/collection_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/collection/collection_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/feedback/feedback_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/footprint/foot_print_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/footprint/foot_print_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/subpage/modify_user_avatar/modify_user_avatar_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/subpage/modify_user_avatar/modify_user_avatar_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/subpage/modify_user_nickname_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/subpage/about_app_page.dart';
import 'package:taoju5_c/ui/pages/net_off/net_off_page.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_binding.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commt_order_page.dart';
import 'package:taoju5_c/ui/pages/order/commit_order_success/commit_order_success_binding.dart';
import 'package:taoju5_c/ui/pages/order/commit_order_success/commit_order_success_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/aftersell_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/aftersell_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/edit_log/order_edit_log_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/edit_log/order_edit_log_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/logistics/logistcis_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/logistics/logistics_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/order_comment/order_comment_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/order_comment/order_comment_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/refund/refund_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/refund/refund_page.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/select_refund_product/select_refund_product_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/select_refund_product/select_refund_product_page.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_binding.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_page.dart';
import 'package:taoju5_c/ui/pages/pay/pay_binding.dart';
import 'package:taoju5_c/ui/pages/pay/pay_page.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/product_detail_binding.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/product_detail_page.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_detail/product_comment_detail_binding.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_detail/product_comment_detail_page.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_list/product_comment_list_binding.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/subpage/comment_list/product_comment_list_page.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_binding.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_page.dart';
import 'package:taoju5_c/ui/pages/product/product_selectable_list/product_selectable_list_binding.dart';
import 'package:taoju5_c/ui/pages/product/product_selectable_list/product_selectable_list_page.dart';
import 'package:taoju5_c/ui/pages/scene/scene_category/scene_category_binding.dart';
import 'package:taoju5_c/ui/pages/scene/scene_category/scene_category_page.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/scene_detail_binding.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/scene_detail_page.dart';
import 'package:taoju5_c/ui/pages/scene/scene_list/scene_list_binding.dart';
import 'package:taoju5_c/ui/pages/scene/scene_list/scene_list_page.dart';
import 'package:taoju5_c/ui/pages/search/search_binding.dart';
import 'package:taoju5_c/ui/pages/search/search_page.dart';
import 'package:taoju5_c/ui/pages/search/subpage/product_search_list/product_search_binding.dart';
import 'package:taoju5_c/ui/pages/search/subpage/product_search_list/product_search_page.dart';
import 'package:taoju5_c/ui/pages/soft_decoration/soft_decoration_list_binding.dart';
import 'package:taoju5_c/ui/pages/soft_decoration/soft_decoration_list_page.dart';
import 'package:taoju5_c/ui/pages/store/store_detail/store_detail_binding.dart';
import 'package:taoju5_c/ui/pages/store/store_detail/store_detail_page.dart';
import 'package:taoju5_c/ui/pages/store/store_list/store_list_binding.dart';
import 'package:taoju5_c/ui/pages/store/store_list/store_list_page.dart';
import 'package:taoju5_c/ui/pages/video/video_player_binding.dart';
import 'package:taoju5_c/ui/pages/video/video_player_page.dart';

import 'app_routes.dart';
import 'middleware/auth_middleware.dart';

class AppPages {
  static final pages = [
    ///登录
    GetPage(
        name: AppRoutes.loginGuide,
        page: () => LoginGuidePage(),
        binding: LoginGuideBinding()),
    GetPage(
        name: AppRoutes.customerPasswordLogin,
        page: () => CustomerPasswordLoginPage(),
        binding: CustomerLoginBinding()),
    GetPage(
        name: AppRoutes.customerSmsLogin,
        page: () => CustomerSmsLoginPage(),
        binding: CustomerLoginBinding()),
    GetPage(
        name: AppRoutes.setPassword,
        page: () => SetPasswordPage(),
        binding: SetPasswordBinding()),

    GetPage(
        name: AppRoutes.businessPasswordLogin,
        page: () => BusinessPasswordLoginPage(),
        binding: BusinessLoginBinding()),
    GetPage(
        name: AppRoutes.businessSmsLogin,
        page: () => BusinessSmsLoginPage(),
        binding: BusinessLoginBinding()),

    GetPage(
        name: AppRoutes.modifyPassword1,
        page: () => ModifyPasswordFirstPage(),
        binding: ModifyPasswordBinding()),

    GetPage(
        name: AppRoutes.modifyPassword2,
        page: () => ModifyPasswordSecondPage(),
        binding: ModifyPasswordBinding()),

    GetPage(
        name: AppRoutes.bindTelephone,
        page: () => BindTelephonePage(),
        binding: BindTelephoneBinding()),

    GetPage(
        name: AppRoutes.modifyTelephone1,
        page: () => ModifyTelephoneFirstPage(),
        binding: ModifyTelephoneBinding()),

    GetPage(
        name: AppRoutes.modifyTelephone2,
        page: () => ModifyTelephoneSecondPage(),
        binding: ModifyTelephoneBinding()),

    GetPage(
        name: AppRoutes.main,
        page: () => MainPage(),
        binding: MainBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: AppRoutes.cart, page: () => CartPage(), binding: CartBinding()),

    GetPage(
        name: AppRoutes.mine,
        page: () => MinePage(),
        binding: MineBinding(),
        children: [
          GetPage(
              name: AppRoutes.orderList,
              page: () => OrderListPage(),
              binding: OrderListBinding()),
          GetPage(
              name: AppRoutes.profile,
              page: () => ProfilePage(),
              binding: ProfileBinding(),
              children: [
                GetPage(
                  name: AppRoutes.modifyUserNickname,
                  page: () => ModifyUserNicknamePage(),
                  binding: ProfileBinding(),
                ),
                GetPage(
                  name: AppRoutes.modifyUserAvatar,
                  page: () => ModifyUserAvatarPage(),
                  binding: ModifyUserAvatarBinding(),
                )
              ]),

          ///地址列表
          GetPage(
              name: AppRoutes.addressList,
              page: () => AddressListPage(),
              binding: AddressListBinding()),

          ///地址编辑
          GetPage(
              name: AppRoutes.addressEdit,
              page: () => AddresseEditPage(),
              binding: AddressEditBinding(),
              children: [
                GetPage(
                    name: AppRoutes.location,
                    page: () => LocationPage(),
                    binding: LocationBinding())
              ]),
          GetPage(
              name: AppRoutes.setting,
              page: () => SettingPage(),
              binding: SettingBinding(),
              children: [
                GetPage(
                  name: AppRoutes.aboutApp,
                  page: () => AboutAppPage(),
                ),
              ]),
          GetPage(
              name: AppRoutes.account,
              page: () => AccountPage(),
              binding: AccountBinding()),

          GetPage(
              name: AppRoutes.feedback,
              page: () => FeedbackPage(),
              binding: FeedbackBinding()),
          GetPage(
              name: AppRoutes.footPrint,
              page: () => FootPrintPage(),
              binding: FootPrintBinding()),

          GetPage(
              name: AppRoutes.collection,
              page: () => CollectionPage(),
              binding: CollectionBinding())
        ]),

    GetPage(
        name: AppRoutes.category,
        page: () => CategoryPage(),
        binding: CategoryBinding(),
        children: [
          GetPage(
              name: AppRoutes.productList,
              page: () => ProductListPage(),
              binding: ProductListBinding()),
          GetPage(
              name: AppRoutes.productDetail + "/:id",
              page: () => ProductDetailPage(),
              binding: ProductDetailBinding(),
              middlewares: [
                ProductBrowserMiddleware(priority: 9)
              ],
              children: [
                GetPage(
                    name: AppRoutes.productCommentList,
                    page: () => ProductCommentListPage(),
                    binding: ProductCommentListBinding()),
                GetPage(
                    name: AppRoutes.productCommentDetail,
                    page: () => ProductCommentDetailPage(),
                    binding: ProductCommentDetailBinding()),
              ]),
        ]),

    ///搜索
    GetPage(
        name: AppRoutes.search,
        page: () => SearchPage(),
        binding: SearchBinding(),
        children: [
          GetPage(
              name: AppRoutes.searchProduct + "/:keyword",
              page: () => ProductSearchPage(),
              binding: ProductSearchBinding()),
        ]),
    GetPage(
        name: AppRoutes.searchProduct + "/:keyword",
        page: () => ProductSearchPage(),
        binding: ProductSearchBinding()),

    GetPage(
        name: AppRoutes.imageCrop,
        page: () => ImageCropPage(),
        binding: ImageCropBinding()),

    GetPage(
        name: AppRoutes.videoPlayer + "/:id",
        page: () => VideoPage(),
        binding: VideoBinding()),

    GetPage(
        name: AppRoutes.articleDetail + "/:id",
        page: () => ArticleDetailPage(),
        binding: ArticleDetailBinding()),

    GetPage(
      name: AppRoutes.netOff,
      page: () => NetOffPage(),
    ),

    GetPage(
        name: AppRoutes.commitOrder,
        page: () => CommitOrderPage(),
        binding: CommitOrderBinding()),
    GetPage(
        name: AppRoutes.commitOrderSuccess + "/:order_id",
        page: () => CommitOrderSuccessPage(),
        binding: CommitOrderSuccessBinding()),
    GetPage(
        name: AppRoutes.orderDetail + "/:order_id",
        page: () => OrderDetailPage(),
        binding: OrderDetailBinding(),
        children: [
          GetPage(
              name: AppRoutes.afterSell,
              page: () => AfterSellPage(),
              binding: AftersellBinding()),
          GetPage(
              name: AppRoutes.logistics,
              page: () => LogisticsPage(),
              binding: LogisticsBinding()),
          GetPage(
              name: AppRoutes.mainfest,
              page: () => OrderMainfestPage(),
              binding: OrderMainfestBinding()),
          GetPage(
              name: AppRoutes.editLog,
              page: () => OrderEditLogPage(),
              binding: OrderEditLogBinding()),
          GetPage(
              name: AppRoutes.orderComment,
              page: () => OrderCommentPage(),
              binding: OrderCommentBinding()),
          GetPage(
              name: AppRoutes.measureData + "/:id",
              page: () => MeasureDataPage(),
              binding: MeasureDataBinding()),
          GetPage(
              name: AppRoutes.refund,
              page: () => RefundPage(),
              binding: RefundBinding()),
          GetPage(
              name: AppRoutes.selectRefundProduct,
              page: () => SelectRefundProductPage(),
              binding: SelectRefundProductBinding())
        ]),

    ///支付
    GetPage(name: AppRoutes.pay, page: () => PayPage(), binding: PayBinding()),

    // ///显示地图
    // GetPage(
    //     name: AppRoutes.amap,
    //     page: () => AMapViewPage(),
    //     binding: AMapViewBinding()),

    ///消息中心
    GetPage(
        name: AppRoutes.message,
        page: () => MessagePage(),
        binding: MessageBinding(),
        children: [
          GetPage(
              name: AppRoutes.orderMessage + "/:id",
              page: () => OrderMessageDetailPage(),
              binding: OrderMessageDetailBinding()),
          GetPage(
              name: AppRoutes.activityMessage + "/:id",
              page: () => ActivityMessagePage(),
              binding: ActivityMessageBinding())
        ]),

    ///场景分类

    GetPage(
        name: AppRoutes.sceneCategoryList,
        page: () => SceneCategoryPage(),
        binding: SceneCategoryBinding(),
        children: [
          GetPage(
              name: AppRoutes.sceneList,
              page: () => SceneListPage(),
              binding: SceneListBinding())
        ]),

    ///场景详情
    GetPage(
      name: AppRoutes.sceneDetail + "/:id",
      page: () => SceneDetailPage(),
      binding: SceneDetailBinding(),
    ),

    ///门店详情
    GetPage(
      name: AppRoutes.storeDetail + "/:id",
      page: () => StoreDetailPage(),
      binding: StoreDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.storeList,
      page: () => StoreListPage(),
      binding: StoreListBinding(),
    ),

    GetPage(
      name: AppRoutes.selectProduct,
      page: () => ProductSelectableListPage(),
      binding: ProductSelectableListBinding(),
    ),

    ///软装列表
    GetPage(
        name: AppRoutes.softDecorationList,
        page: () => SoftDecorationListPage(),
        binding: SoftDecorationListBinding())
  ];
}
