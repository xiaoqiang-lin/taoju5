/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-23 09:40:02
 * @LastEditTime: 2021-04-23 10:03:57
 */
import 'package:get/get.dart';

class ArticleDetailController extends GetxController {
  List<String> pngSlices = [
    "https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/dc49d48471fb4a298af735c31c6ad71f~tplv-k3u1fbpfcp-watermark.image",
    "https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/57a94a899c984625839cfebb43771da7~tplv-k3u1fbpfcp-watermark.image",
    "https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5d20e3563caa451c8141f53674ec5b1c~tplv-k3u1fbpfcp-watermark.image",
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/45510c500c9f4ebd8b833d3ff2594d3c~tplv-k3u1fbpfcp-watermark.image",
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/02b81f1bf9fc4cdc82c0329f709fb7a8~tplv-k3u1fbpfcp-watermark.image",
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8506bff7a8b647ae9d93526f24c6847b~tplv-k3u1fbpfcp-watermark.image"
  ];

  List<String> png = [
    "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7d67ec14ca3a4a6e870966d51fad027d~tplv-k3u1fbpfcp-watermark.image",
  ];

  List<String> webpSlices = [
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/cd5ae8611499480b99d3995cbfb429aa~tplv-k3u1fbpfcp-watermark.image",
    "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/96aeff89a0bb424585cc6b1e662e0338~tplv-k3u1fbpfcp-watermark.image",
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/134416843e7c415d856d2a1a08b94ba4~tplv-k3u1fbpfcp-watermark.image",
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/259d4a188a3a4014a75d86571c833ff6~tplv-k3u1fbpfcp-watermark.image",
    "https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/717a3113ae2741149dd1b3f7c5aae3a4~tplv-k3u1fbpfcp-watermark.image",
    "https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/eb5ead41c81842bd8934db2a043ee695~tplv-k3u1fbpfcp-watermark.image"
  ];

  List<String> webp = [
    "https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e009e5e2efc14f19a3a8dc8daf200ba5~tplv-k3u1fbpfcp-watermark.image"
  ];

  List<String> get slices =>
      {1: pngSlices, 2: png, 3: webpSlices, 4: webp}[Get.arguments] ??
      webpSlices;
}
