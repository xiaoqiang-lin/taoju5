/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 22:39:50
 * @LastEditTime: 2021-02-10 22:38:41
 */

import 'package:get/get.dart';
import 'package:taoju5/bc-app/ui/pages/debug/debug_binding.dart';
import 'package:taoju5/bc-app/ui/pages/debug/debug_page.dart';
import 'package:taoju5/capp/ui/pages/home/home_page.dart';
import 'package:taoju5/capp/ui/pages/mine/mine_binding.dart';
import 'package:taoju5/capp/ui/pages/mine/mine_page.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/address/address_binding.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/address/address_page.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/profile/profile_binding.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/profile/profile_page.dart';

import 'capp_routes.dart';

class CAppPages {
  static final pages = [
    GetPage(
        name: CAppRoutes.home,
        page: () => CHomePage(),
        binding: DebugBinding()),
    GetPage(
        name: CAppRoutes.debug,
        page: () => DebugEnvPage(),
        binding: DebugBinding()),

    GetPage(
        name: CAppRoutes.mine,
        page: () => CMinePage(),
        binding: CMineBinding(),
        children: [
          GetPage(
              name: CAppRoutes.profile,
              page: () => CProfilePage(),
              binding: CProfileBinding()),
          GetPage(
              name: CAppRoutes.address,
              page: () => CAddressPage(),
              binding: CAddressBinding())
        ]),

    // ///显示地图
    // GetPage(
    //     name: CAppRoutes.amap,
    //     page: () => AMapViewPage(),
    //     binding: AMapViewBinding()),
  ];
}
