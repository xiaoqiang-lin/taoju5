'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "875316497852d5d920fcf00bddaad1d2",
"index.html": "2f516ec8df7f248c2ffad5b2b89bcb20",
"/": "2f516ec8df7f248c2ffad5b2b89bcb20",
"main.dart.js": "d3eefef854b3a95f3444a4b7090e0ba8",
"favicon.png": "23c9191c743f0e5398d18f84adea9b93",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b630cde0a430147e06bb0038a891a560",
"assets/AssetManifest.json": "5a1d2ad30905efefc16c08fe3f9f469a",
"assets/NOTICES": "9ff93f9b31fc1030825d5ffd89432cc0",
"assets/FontManifest.json": "076a1e34bf231ad693bee505ce45341d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/images/default_avatar.png": "af8f40a5eddce46bd4522c8e45d7e3cb",
"assets/assets/images/not_bay_window.png": "0b1454a5db8a480d258fcb9a91583bd4",
"assets/assets/images/plus.png": "91f45a9f904607d099cd8af2917b3956",
"assets/assets/images/customer_avatar.png": "cf59df7d03c9a259b6d4b4bd4fcfed08",
"assets/assets/images/net_off.png": "6eec1edbbece7cd80b5971705ced9dc1",
"assets/assets/images/combo.png": "7e9b7a21a31f01cdac268d0f07a747fb",
"assets/assets/images/placeholder_img.jpg": "9b135bdc9f7585b0d3d12d5971ee8008",
"assets/assets/images/404.png": "e4aba585c6aa67b7735987415b6ff56f",
"assets/assets/images/product_list_cart.png": "3e37cc95e682d5919efe34c075546de6",
"assets/assets/images/finished_customer.png": "9b801f771d6ee6ea296507abfbdc05e0",
"assets/assets/images/app_upgrade.png": "f7f4c09776b10d526c291dcbcabaf2c3",
"assets/assets/images/settings.png": "6b81b01f1c19afa7b4b804bc10c09d13",
"assets/assets/images/customer_cart.png": "03096c82b7e19e5cb822b1a7d9ac352c",
"assets/assets/images/ship.png": "d661bea59cb97b7bb34ac5b1caf3f5a0",
"assets/assets/images/order.png": "16c1a4281bca7fea5aa33b0c5ed0b1ec",
"assets/assets/images/potential_customer.png": "61ed2a3b93249c3db0dea4b50bc1a536",
"assets/assets/images/curtain/size_200100.png": "a7d1e25b779e7787ca16ac14992f323a",
"assets/assets/images/curtain/size_0111-1-1-UPY-L.png": "408572f52f305d4c3190bac68a111e7a",
"assets/assets/images/curtain/size_200101.png": "555e9f08a5bb7e8801d7258f55125967",
"assets/assets/images/curtain/size_2101-1-1.png": "65aff3dffe68a599004a73f879f00829",
"assets/assets/images/curtain/size_0011-1-1.png": "8052d52099ab6a77bcadeb12312880d0",
"assets/assets/images/curtain/size_2110-1-1.png": "4374a4c9c106811cab7ffe69967fecdd",
"assets/assets/images/curtain/size_2100-1-1.png": "d2dcc10b3eabd5ec13a3a9698bb953aa",
"assets/assets/images/curtain/size_0010-1-1.png": "36fa1bd18e2def5be23772daf66df635",
"assets/assets/images/curtain/size_200111.png": "d910c7936866c9b6365e211ae043f6f6",
"assets/assets/images/curtain/size_0110-1-1-LPY-H.png": "49a0fee9c391be623d691507c73e4bb9",
"assets/assets/images/curtain/size_200110.png": "1e44317929d945dbb267cbd194c04147",
"assets/assets/images/curtain/size_2011-1-1.png": "760fb630c356070fad416480cc969e25",
"assets/assets/images/curtain/size_200000.png": "36fa2129dfab03973d822a55e8e24759",
"assets/assets/images/curtain/size_200001.png": "2d0e3b9e9b018dd29ddd63a996587479",
"assets/assets/images/curtain/size_0111-1-1.png": "408572f52f305d4c3190bac68a111e7a",
"assets/assets/images/curtain/size_0101-1-1.png": "00ae7857f07c2c463788ef71c0fb3604",
"assets/assets/images/curtain/size_2010-1-1.png": "df98e79f523f373a294f54a0eaadec05",
"assets/assets/images/curtain/size_200011.png": "e841a8dfd2970da0294cdd403e335b79",
"assets/assets/images/curtain/size_200010.png": "0dc72e97c9c031021949e47e5c9d1103",
"assets/assets/images/curtain/size_0100-1-1.png": "d12c17ff3102e5e0d362c82b6504901b",
"assets/assets/images/curtain/size_0110-1-1.png": "f0987f99ff78d0f555149df97996383a",
"assets/assets/images/curtain/size_0101-1-1-SPW-L.png": "00ae7857f07c2c463788ef71c0fb3604",
"assets/assets/images/curtain/size_0110-1-1-SPY-H.png": "f0987f99ff78d0f555149df97996383a",
"assets/assets/images/curtain/size_000111.png": "b784ae508cadeee3d9e64bd7939d4204",
"assets/assets/images/curtain/size_100111.png": "f77eb84c6bd04427db87366ad25f4db2",
"assets/assets/images/curtain/size_1010-1-1.png": "0bb7718574f32af5c8e942c00deaeedb",
"assets/assets/images/curtain/size_100110.png": "2bc3ce6dfe1963711647019edc440a92",
"assets/assets/images/curtain/size_000110.png": "0a802cb1a115759d59bbeb11f32173b8",
"assets/assets/images/curtain/size_0100-1-1-SPW-H.png": "d12c17ff3102e5e0d362c82b6504901b",
"assets/assets/images/curtain/size_0111-1-1-SPY-L.png": "ecc3c8ace90af4e183825e3b041b3096",
"assets/assets/images/curtain/size_100100.png": "b9edb48b836b43618d7d13d6fb6e0b4b",
"assets/assets/images/curtain/size_000100.png": "6921095976e2abbb63da08c5b34a39d6",
"assets/assets/images/curtain/size_1011-1-1.png": "df5b98cc75d267f45e102d19f58203d0",
"assets/assets/images/curtain/size_000101.png": "edacda69996a0ad54d4093aa60f8c637",
"assets/assets/images/curtain/size_100101.png": "2e1ebc541492e2a04178bdc7bf50d750",
"assets/assets/images/curtain/size_1100-1-1.png": "305b74583bdc7793fcd3069bc125a350",
"assets/assets/images/curtain/size_000011.png": "7c09139baac1aaa85eb1212a8c8c49b2",
"assets/assets/images/curtain/size_100011.png": "e8e796e82134a6f72863b5585124332a",
"assets/assets/images/curtain/size_100010.png": "1ca59bc2e8d795b8baf325e7eb38e0c0",
"assets/assets/images/curtain/size_000010.png": "3a1e3f76016516a371bf7bb2695d1f83",
"assets/assets/images/curtain/size_100000.png": "c6c067fdabc0f41c49ddfb52354d0e6a",
"assets/assets/images/curtain/size_000000.png": "6e444fd2b239131cfca29c34e60f5d39",
"assets/assets/images/curtain/size_000001.png": "d189708766a1092a392f5d5372dee566",
"assets/assets/images/curtain/size_100001.png": "7aba29c60acc7e13bf1dce840dcf078d",
"assets/assets/images/curtain/size_0111-1-1-LPY-L.png": "29d4a50a62744ce2925cd0ae71263671",
"assets/assets/images/curtain/size_1101-1-1.png": "458a89d8cd5a733b4d3bf64d8aaf1f71",
"assets/assets/images/empty.png": "838efb522ae9f14815fee5f4c9c7aff5",
"assets/assets/images/2.0x/plus.png": "c8ac4933059347a1a08f2d72216967d0",
"assets/assets/images/2.0x/net_off.png": "fa23c0d64b414bad5722097076f52f06",
"assets/assets/images/2.0x/combo.png": "62f570bd4e528e1158c9b5f156e64b00",
"assets/assets/images/2.0x/product_list_cart.png": "a84153b4bcd05d1c240c32355ebf6d91",
"assets/assets/images/2.0x/finished_customer.png": "353ed12504e3776f85848f109a1a7c30",
"assets/assets/images/2.0x/settings.png": "f506372b251f710cc43f9487af8c545e",
"assets/assets/images/2.0x/customer_cart.png": "674004afe5f694302ada8f3bd21a4362",
"assets/assets/images/2.0x/ship.png": "d661bea59cb97b7bb34ac5b1caf3f5a0",
"assets/assets/images/2.0x/order.png": "d4f7398dbe1fbf4fffd31465c1a050ab",
"assets/assets/images/2.0x/potential_customer.png": "ab01a4347e15db86a6b142ac5da3203a",
"assets/assets/images/2.0x/empty.png": "1ae0177411a41274a44713fb74433959",
"assets/assets/images/2.0x/customer_order.png": "0c701ee0607d7cea41ad519c6a8bb0ed",
"assets/assets/images/2.0x/blank_heart.png": "2e5ef52be3d90072781bada2a690ae05",
"assets/assets/images/2.0x/grid_mode.png": "f4e212236816f95fdaba60a322e42805",
"assets/assets/images/2.0x/filled_heart.png": "f609ac0fdeec66f0c3e55b8afdacf631",
"assets/assets/images/2.0x/product_detail_cart.png": "a42723a18c80f132a732033f64a208dd",
"assets/assets/images/2.0x/customer_collection.png": "3a93c85ed312549f23088cbe8db0a8af",
"assets/assets/images/2.0x/triangle.png": "e3551f8f596a80e99c78a25f1ee0dcb4",
"assets/assets/images/2.0x/customer.png": "6ab11128db5368b764284dbfa399c166",
"assets/assets/images/2.0x/data_center.png": "8851a3726d24124b0a549d1bab468d6a",
"assets/assets/images/2.0x/customer_badge.png": "c0ef9911c8a6a09d13309c3748a91067",
"assets/assets/images/2.0x/substract.png": "4b5f2bed0d110273497c52314e084cca",
"assets/assets/images/2.0x/wechat_moment.png": "211147e07637741bf30164ba2bdb0ad6",
"assets/assets/images/2.0x/logo.png": "72824247abcfaed5147090a96d411bd4",
"assets/assets/images/2.0x/shadow_mask.png": "a1277efd449d70b06f3d57c21eb03bb1",
"assets/assets/images/2.0x/filter.png": "386dab70ae1249c62e1c7a3271750bb3",
"assets/assets/images/2.0x/share.png": "b113bf0d2c6a82159c52a46a33c15095",
"assets/assets/images/2.0x/following_customer.png": "55c53992786e82a8a21810bbf79ee341",
"assets/assets/images/2.0x/success.png": "ffaf0d21cd7702a019a299b928b8392a",
"assets/assets/images/2.0x/upload_image.png": "28b46e66a1913773005fcd15ffe661eb",
"assets/assets/images/2.0x/measure.png": "e66dc9adee176e9aa089e892c3043f7c",
"assets/assets/images/2.0x/copy_link.png": "3273a51966ef4f35df622143f1492b31",
"assets/assets/images/2.0x/edit.png": "832dcfe67668d79db4edbbbede19d5a8",
"assets/assets/images/2.0x/more.png": "556248811400481494c1e04e2e39ecf4",
"assets/assets/images/2.0x/init_customer.png": "f82255336b02ec746c168f64e4929a9e",
"assets/assets/images/2.0x/wechat.png": "d5f719908a48d1e1fdd3aa523fe68c96",
"assets/assets/images/2.0x/no_data.png": "0aeb826ddbe80d8cdc52c5c58c75c798",
"assets/assets/images/2.0x/list_mode.png": "62b473e7c754ee8391a1c8c79f0b2869",
"assets/assets/images/2.0x/after_sell_service.png": "cc1867949034d067954a7c5407aa989c",
"assets/assets/images/2.0x/product_list_measure_order.png": "60ef50f48d7bb4154849ff35251f13f2",
"assets/assets/images/2.0x/net_err.png": "ab4354a8a970ed9f4c58f78aa7b53832",
"assets/assets/images/2.0x/customer_add.png": "416593b165d788a1d5d89ff8e6be71f9",
"assets/assets/images/bay_window.png": "7c75d06d267fc9bc1fbc0034c0ce2c50",
"assets/assets/images/customer_order.png": "8f438fff201574c0ee7b630619ceaa1c",
"assets/assets/images/blank_heart.png": "499005c7a55af9d3ddb9cf761c7b250e",
"assets/assets/images/grid_mode.png": "b12f510a69961408ab8e61cdceedb2eb",
"assets/assets/images/filled_heart.png": "6b476cc72d7a07bcb1bf950193ff3b16",
"assets/assets/images/product_detail_cart.png": "f2b0faf4fdca2a1d841d1d945cf96f01",
"assets/assets/images/3.0x/plus.png": "deccd3a793458521ca4a09b78c162a9b",
"assets/assets/images/3.0x/net_off.png": "d421ba15cf02abe084ee49228fd55812",
"assets/assets/images/3.0x/combo.png": "b6466d131d50ef441a2cc668ea044cf4",
"assets/assets/images/3.0x/product_list_cart.png": "00287f934687427c5235c955cce02ec5",
"assets/assets/images/3.0x/finished_customer.png": "1bbcd2d04601ae7bf0004e156e262b39",
"assets/assets/images/3.0x/settings.png": "d345a63c5465921e978e0df862db006f",
"assets/assets/images/3.0x/customer_cart.png": "462f9021252b43eec12bd0aeec6cfa3b",
"assets/assets/images/3.0x/wechat_monent.png": "6ae0b44966701775b55e37d97d1be408",
"assets/assets/images/3.0x/order.png": "2b57f585adda9891cfd19ea4a72a79fb",
"assets/assets/images/3.0x/potential_customer.png": "418ac8962a1940f7591234fbe02c91c9",
"assets/assets/images/3.0x/empty.png": "a2f9bf4039e0b076cdb6f883564b388c",
"assets/assets/images/3.0x/customer_order.png": "cc948634d8879896af161cd05a886d4d",
"assets/assets/images/3.0x/blank_heart.png": "5d6e44cbc7c16a1892a927b8c0ca2685",
"assets/assets/images/3.0x/grid_mode.png": "392aa8fb481cc3625e19a6e9bd898e2e",
"assets/assets/images/3.0x/filled_heart.png": "ba312dad97149f72970cfc079b0a400f",
"assets/assets/images/3.0x/product_detail_cart.png": "4c5898b266b0fa9c55e0f9a3dbcdebe6",
"assets/assets/images/3.0x/customer_collection.png": "43cd71b01458bfde55d71107364b43f4",
"assets/assets/images/3.0x/triangle.png": "449ba19f146ba580aaaeece150a53cbc",
"assets/assets/images/3.0x/customer.png": "78a9ac60e66ab7fa1efd21c9858e784a",
"assets/assets/images/3.0x/data_center.png": "55835b28625b6bb1dce60aba1b04961b",
"assets/assets/images/3.0x/customer_badge.png": "53a4e575af21104eeea3b44be69386f9",
"assets/assets/images/3.0x/substract.png": "ddbb009490d580e9f11c1f7fe9707c3f",
"assets/assets/images/3.0x/logo.png": "fe54cd83b1412ac8d06dfa54f4d05c83",
"assets/assets/images/3.0x/shadow_mask.png": "c7227b9b197c4a612782d6793042998b",
"assets/assets/images/3.0x/filter.png": "3609897e8f83b92cccd6585676e79dbc",
"assets/assets/images/3.0x/share.png": "37b885615775b7578b0264100d507898",
"assets/assets/images/3.0x/following_customer.png": "9d1c8830281b56bf0fd394f8ed06a59f",
"assets/assets/images/3.0x/success.png": "0c230258bf9c6611e005a672c2ae6e57",
"assets/assets/images/3.0x/upload_image.png": "aa86e2a70fc3a969edc31b8c967da061",
"assets/assets/images/3.0x/measure.png": "ae4b9c470ac6a6de185947767ebb9940",
"assets/assets/images/3.0x/copy_link.png": "9b66e17aac95a704666bb9c254cec9e7",
"assets/assets/images/3.0x/edit.png": "4006caaafbd127d36a0bdd8063487abd",
"assets/assets/images/3.0x/more.png": "18db0a3bd6eeda36635c660f55f902f5",
"assets/assets/images/3.0x/init_customer.png": "973d2f2ac80cb215a962ce372839acac",
"assets/assets/images/3.0x/wechat.png": "f10d4a6ce9f3768f630809f10da58a9c",
"assets/assets/images/3.0x/no_data.png": "fe663d1ff8692dedb15db94a66af374d",
"assets/assets/images/3.0x/list_mode.png": "25bcb78192ea6d09b24be0256f8bd2d1",
"assets/assets/images/3.0x/after_sell_service.png": "a76f9cf6565bebbd84cf04dcaaaa44da",
"assets/assets/images/3.0x/product_list_measure_order.png": "fdc40cc7b9571edbdee73401e407abb4",
"assets/assets/images/3.0x/net_err.png": "3955551feb41f4c4bdf6ebe4072974df",
"assets/assets/images/3.0x/customer_add.png": "7c5cb61986befaa6fc943793e2929986",
"assets/assets/images/customer_collection.png": "d717ee7c2f03375477ad43498d7effe8",
"assets/assets/images/window_no_can.png": "9efbdce05f3cbd5ff888ce38077402d9",
"assets/assets/images/triangle.png": "5c2db6f588fb6d8d328c39bf16017230",
"assets/assets/images/customer.png": "670e052a7efba4bbea000ccc7a465544",
"assets/assets/images/data_center.png": "166573f962aec707580b3d8009f484a1",
"assets/assets/images/customer_badge.png": "ea0cb6a17a0921f717492cba2039a403",
"assets/assets/images/substract.png": "6db0c84c2fd93101ee3d302f3f722fba",
"assets/assets/images/wechat_moment.png": "6359c4d7bd643a93eec1dd55a032b3ee",
"assets/assets/images/logo.png": "62978eb5ee05ea0fb4647d6119548030",
"assets/assets/images/shadow_mask.png": "de7a19edea49247679a95aa79f6eeeaa",
"assets/assets/images/filter.png": "6004f338e7619634e40a4e770b3670cb",
"assets/assets/images/single_window_pattern.png": "e6821e39967f1785ffa1e2e564f00ea3",
"assets/assets/images/share.png": "bcf5bf5b3e35846a3c6ae64b82cb1b4d",
"assets/assets/images/following_customer.png": "4e32369f99dffd365f7c3bbb27efabb3",
"assets/assets/images/success.png": "0583ab0df8274afd173b767ce1189f8b",
"assets/assets/images/upload_image.png": "01452343bddbe9af0b00275369c9818e",
"assets/assets/images/window_with_can.png": "79b5903d5f4729c0114b5f96743494cf",
"assets/assets/images/measure.png": "f1f878404ab9338641bcf99498c4dfe3",
"assets/assets/images/copy_link.png": "685f51f6248bb042e705fa362a60c698",
"assets/assets/images/edit.png": "85dbab8f09cbb98fa103f26e3496c63b",
"assets/assets/images/L_window_pattern.png": "3e0e30f0527003029a40896b10e29ff9",
"assets/assets/images/more.png": "9a6c2fef32ff1becf09dda479fb57e45",
"assets/assets/images/init_customer.png": "614ff85a3283c6277d4c52586197e238",
"assets/assets/images/wechat.png": "31c170d4e28b84bfac975bf223a2fa2d",
"assets/assets/images/no_data.png": "8969176d024e5fdae933c4c10f35b7f4",
"assets/assets/images/list_mode.png": "33d9730ac78ea1b520879d8906cb24ca",
"assets/assets/images/U_window_pattern.png": "27946482d0bc922a3bbcda8285683465",
"assets/assets/images/after_sell_service.png": "56c845230562af762e5ee04cb5fdb29b",
"assets/assets/images/product_list_measure_order.png": "17f66382b113e4a920e578863f5981be",
"assets/assets/images/net_err.png": "f900eb5f28c3cb172ffb836f6c4e2488",
"assets/assets/images/customer_add.png": "bff66beb6b07d861ae33acaef7257ae9",
"assets/assets/flrs/submit_status.flr": "279b653e902181ccae685da05d9db22a",
"assets/assets/fonts/iconfont.ttf": "dfe5ac0942ecc7a887f0feda30f14927",
"assets/assets/data/curtain_mode.json": "bda3e9fc69f9b54f2b9b371f9e7ba389"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
