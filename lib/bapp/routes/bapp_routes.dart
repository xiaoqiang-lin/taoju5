/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-18 16:16:31
 * @LastEditTime: 2021-09-15 20:40:19
 */
part of 'bapp_pages.dart';

abstract class BAppRoutes {
  static const home = '/home';

  static const debug = '/debug';

  static const dashboard = '/dashboard';

  static const login = '/login';

  ///重置密码
  static const resetPassword = '/login/resetPassword';

  ///忘记密码
  static const forgetPassword = '/login/forgetPassword';

  ///设置密码
  static const modifyPassword = '/login/modifyPassword';

  static const productList = '/productList';

  static const selectableProductList = '/selectableProductList';

  static const productDetail = '/productDetail';

  static const webProductDetail = '/webProductDetail';

  static const productShare = '/productShare';

  static const productDetailV2 = '/productDetailV2';

  static const sceneProductDetail = '/sceneProductDetail';

  static const softProductDetail = '/softProductDetail';

  static const productQuotation = '/productQuotation';

  static const editMeasureData = '/editMeasureData';

  static const customerList = '/customerList';

  static const categoryCustomerList = '/categoryCustomerList';

  static const customerDetail = '/customerDetail';

  static const customerEdit = '/customerEdit';

  static const customerAddressEdit = '/customerAddressEdit';

  static const orderList = '/orderList';

  static const orderDetail = '/orderDetail';

  static const orderLogistics = "/orderLogistics";

  static const orderMainfest = '/orderMainfest';

  static const orderLog = '/orderLog';

  static const orderMeasureData = '/orderMeasureData';

  static const orderMeasureDataEdit = '/orderMeasureDataEdit';

  static const commitOrder = '/commitOrder';

  static const commitOrderSuccess = '/commitOrderSuccess';

  static const setting = '/setting';

  static const feedback = '/feedback';

  static const appVersion = '/appVersion';

  static const cart = '/cart';

  static const modifyCurtainProductAttr = '/modifyCurtainProductAttr';

  static const dashBoard = '/dashboard';

  static const search = '/search';

  static const collection = '/collection';

  static const afterSell = '/afterSell';

  static const userProtocol = '/userProtocol';

  static const scanQRCode = '/scanQRCode';

  static const customerRefund = "/customerRefund";

  static const unkonw = "/404";

  static const searchCustomer = "/customer/search";

  static const searchOrder = "/order/search";

  static const searchProduct = "/product/search";

  static const privacyPolicy = "/privacyPolicy";
}
