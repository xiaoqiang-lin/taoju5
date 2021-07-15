/*
 * @Description: C端app路由
 * @Author: iamsmiling
 * @Date: 2021-02-02 22:40:24
 * @LastEditTime: 2021-07-15 15:47:46
 */

class AppRoutes {
  static const _prefix = '/c';

  static const loginGuide = '/loginGuide';

  ///app程序入口
  static const main = _prefix + '/main';

  static const home = _prefix + '/home';

  static const debug = _prefix + '/debug';

  static const amap = _prefix + '/amap';

  static const mine = _prefix + '/mine';

  static const profile = _prefix + '/profile';

  static const modifyUserAvatar = _prefix + '/modifyUserAvatar';

  static const modifyUserNickname = _prefix + '/modifyUserNickname';

  static const addressList = _prefix + '/address/list';

  static const addressEdit = _prefix + '/address/edit';

  static const location = _prefix + '/location';

  static const feedback = _prefix + '/feedback';

  static const category = _prefix + '/category';

  ///登陆相关
  static const account = _prefix + '/account';

  static const customerPasswordLogin = _prefix + '/customerPasswordLogin';

  static const customerSmsLogin = _prefix + '/customerSmsLogin';

  static const businessPasswordLogin = _prefix + '/businessPasswordLogin';

  static const businessSmsLogin = _prefix + '/businessSmsLogin';
  static const setPassword = _prefix + '/setPassword';

  static const bindTelephone = _prefix + '/bindTelephone';
  static const modifyPassword1 = _prefix + '/modifyPassword/first';

  static const modifyPassword2 = _prefix + '/modifyPassword/second';

  static const modifyTelephone1 = _prefix + '/modifyTelephone/first';

  static const modifyTelephone2 = _prefix + '/modifyTelephone/second';

  ///设置
  static const setting = _prefix + '/setting';

  static const aboutApp = _prefix + '/aboutApp';

  ///订单
  static const afterSell = _prefix + '/afterSell';

  static const orderList = _prefix + '/orderList';

  static const orderComment = _prefix + '/orderComment';

  static const orderDetail = _prefix + '/orderDetail';

  static const imageCrop = _prefix + '/imageCrop';

  static const videoPlayer = _prefix + '/videoPlayer';

  static const articleDetail = _prefix + '/article/detail';

  static const productList = _prefix + '/product/list';

  static const productDetail = _prefix + '/product/detail';

  static const productCommentList = _prefix + '/comment/list';

  static const productCommentDetail = _prefix + '/comment/detail';

  static const netOff = _prefix + '/netOff';

  static const commitOrder = _prefix + '/commitOrder';
  static const commitOrderSuccess = _prefix + '/commitOrderSuccess';

  static const pay = _prefix + '/pay';

  static const search = _prefix + '/search';

  static const cart = _prefix + '/cart';

  static const footPrint = _prefix + '/footPrint';

  static const message = _prefix + '/message';

  static const orderMessage = _prefix + '/orderMessage';

  static const activityMessage = _prefix + '/activityMessage';

  static const logistics = _prefix + "/logistics";

  static const mainfest = _prefix + "/mainfest";

  static const editLog = _prefix + "/editLog";

  static const sceneList = _prefix + "/sceneList";

  static const sceneCategoryList = _prefix + "/sceneCategoryList";

  static const sceneDetail = _prefix + "/sceneDetail";

  static const collection = _prefix + "/collection";

  static const storeDetail = _prefix + '/storeDetail';

  static const measureData = _prefix + "/measureData";

  static const selectProduct = _prefix + "/selectProduct";

  static const refund = _prefix + "/refund";

  static const selectRefundProduct = _prefix + "/selectRefundProduct";

  static const searchProduct = _prefix + "/searchProduct";

  static const searchOrder = _prefix + "/searchOrder";

  static const searchArticle = _prefix + "/searchArticle";
}
