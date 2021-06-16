/*
 * @Description: 门店详情
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:52:33
 * @LastEditTime: 2021-06-09 11:00:58
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/bloc/collect_button.dart';
import 'package:taoju5_c/component/button/bloc/share_button.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("门店详情"),
        actions: [
          CollectButton(category: CollectionCategory.store),
          ShareButton()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChimeraImage(
              "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
              borderRadius: BorderRadius.zero,
            ),
            // Transform.scale(scale: scale)
          ],
        ),
      ),
    );
  }
}
