/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 22:39:50
 * @LastEditTime: 2021-04-17 17:45:37
 */

import 'package:get/get.dart';
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
import 'package:taoju5_c/ui/pages/main/main_page.dart';
import 'package:taoju5_c/ui/pages/mine/mine_binding.dart';
import 'package:taoju5_c/ui/pages/mine/mine_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/account/account_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/address_edit_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_edit/address_edit_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/address/address_list/address_list_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_page.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_binding.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_page.dart';

import 'capp_routes.dart';

class CAppPages {
  static final pages = [
    ///登录
    GetPage(
        name: CAppRoutes.loginGuide,
        page: () => CLoginGuidePage(),
        binding: CLoginGuideBinding()),
    GetPage(
        name: CAppRoutes.customerPasswordLogin,
        page: () => CCustomerPasswordLoginPage(),
        binding: CCustomerLoginBinding()),
    GetPage(
        name: CAppRoutes.customerSmsLogin,
        page: () => CCustomerSmsLoginPage(),
        binding: CCustomerLoginBinding()),

    GetPage(
        name: CAppRoutes.businessPasswordLogin,
        page: () => CBusinessPasswordLoginPage(),
        binding: CBusinessLoginBinding()),
    GetPage(
        name: CAppRoutes.businessSmsLogin,
        page: () => CBusinessSmsLoginPage(),
        binding: CBusinessLoginBinding()),

    GetPage(
        name: CAppRoutes.modifyPassword1,
        page: () => CModifyPasswordFirstPage(),
        binding: CModifyPasswordBinding()),

    GetPage(
        name: CAppRoutes.modifyPassword2,
        page: () => CModifyPasswordSecondPage(),
        binding: CModifyPasswordBinding()),

    GetPage(
        name: CAppRoutes.modifyTelephone1,
        page: () => CModifyTelephoneFirstPage(),
        binding: CModifyTelephoneBinding()),

    GetPage(
        name: CAppRoutes.modifyTelephone2,
        page: () => CModifyTelephoneSecondPage(),
        binding: CModifyTelephoneBinding()),

    GetPage(
        name: CAppRoutes.main,
        page: () => CMainPage(),
        binding: CMineBinding()),

    GetPage(
        name: CAppRoutes.mine,
        page: () => CMinePage(),
        binding: CMineBinding(),
        children: [
          GetPage(
              name: CAppRoutes.profile,
              page: () => CProfilePage(),
              binding: CProfileBinding()),

          ///地址列表
          GetPage(
              name: CAppRoutes.addressList,
              page: () => CAddressListPage(),
              binding: CAddressListBinding()),

          ///地址编辑
          GetPage(
              name: CAppRoutes.addressEdit,
              page: () => CAddresseEditPage(),
              binding: CAddressEditBinding()),
          GetPage(
              name: CAppRoutes.setting,
              page: () => CSettingPage(),
              binding: CSettingBinding()),
          GetPage(
            name: CAppRoutes.account,
            page: () => CAccountPage(),
          )
        ]),

    // ///显示地图
    // GetPage(
    //     name: CAppRoutes.amap,
    //     page: () => AMapViewPage(),
    //     binding: AMapViewBinding()),
  ];
}
