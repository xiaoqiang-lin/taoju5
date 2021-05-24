/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 11:04:53
 * @LastEditTime: 2021-05-19 11:08:45
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';

class FootPrintEntity {
  late String date;

  late List<ProductEntity> products;

  FootPrintEntity.fromJson(Map json) {
    date = "4月12日";
    products = JsonKit.asList([
      {
        "goods_id": 3002,
        "goods_name": "SDL000101",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "1.0k",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901272215329_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901272215329_BIG.jpg"
      },
      {
        "goods_id": 3003,
        "goods_name": "SDL000102",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "1.0w",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901272892764_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901272892764_BIG.jpg"
      },
      {
        "goods_id": 3004,
        "goods_name": "SDL000103",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901274091116_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901274091116_BIG.jpg"
      },
      {
        "goods_id": 3005,
        "goods_name": "SDL000104",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901273813332_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901273813332_BIG.jpg"
      },
      {
        "goods_id": 3006,
        "goods_name": "SDL000201",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901273058383_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901273058383_BIG.jpg"
      },
      {
        "goods_id": 3007,
        "goods_name": "SDL000202",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901273633045_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901273633045_BIG.jpg"
      },
      {
        "goods_id": 3008,
        "goods_name": "SDL000203",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901183397156_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901183397156_BIG.jpg"
      },
      {
        "goods_id": 3009,
        "goods_name": "SDL000301",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901182618026_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901182618026_BIG.jpg"
      },
      {
        "goods_id": 3010,
        "goods_name": "SDL000302",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901182890695_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901182890695_BIG.jpg"
      },
      {
        "goods_id": 3011,
        "goods_name": "SDL000303",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901183199015_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901183199015_BIG.jpg"
      },
      {
        "goods_id": 3012,
        "goods_name": "SDL000304",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901184332660_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901184332660_BIG.jpg"
      },
      {
        "goods_id": 3013,
        "goods_name": "SDL000501",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901183646871_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901183646871_BIG.jpg"
      },
      {
        "goods_id": 3014,
        "goods_name": "SDL000502",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901183847659_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901183847659_BIG.jpg"
      },
      {
        "goods_id": 3015,
        "goods_name": "SDL000503",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901184155976_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901184155976_BIG.jpg"
      },
      {
        "goods_id": 3016,
        "goods_name": "SDL000504",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901185346311_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901185346311_BIG.jpg"
      },
      {
        "goods_id": 3017,
        "goods_name": "SDL000505",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901185156874_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901185156874_BIG.jpg"
      },
      {
        "goods_id": 3018,
        "goods_name": "SDL000506",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901190782024_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901190782024_BIG.jpg"
      },
      {
        "goods_id": 3019,
        "goods_name": "SDL000507",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901184712666_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901184712666_BIG.jpg"
      },
      {
        "goods_id": 3020,
        "goods_name": "SDL000508",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901190500542_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901190500542_BIG.jpg"
      },
      {
        "goods_id": 3021,
        "goods_name": "SDL000601",
        "goods_type": 1,
        "market_price": "259.00",
        "price": "369.00",
        "promotion_price": "369.00",
        "goods_unit": " /米",
        "sales": "24",
        "is_hot": 0,
        "is_new": 0,
        "pic_cover_mid":
            "http://www.taoju5.com/upload/system/2020111901184902196_MID.jpg",
        "pic_cover_big":
            "http://www.taoju5.com/upload/system/2020111901184902196_BIG.jpg"
      }
    ]).map((e) => ProductEntity.fromJson(e)).toList();
  }
}
