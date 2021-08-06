/*
 * @Description: 场景商品详情
 * @Author: iamsmiling
 * @Date: 2021-07-22 09:41:06
 * @LastEditTime: 2021-07-30 16:04:36
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/modal_wrapper/modal_wrapper.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_decoration_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/modal/scene_product_controller.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/modal/widget/scene_finished_product_card.dart';

import 'widget/scene_custom_product_card.dart';
import 'package:get/get.dart';

Future openSceneProductModal(BuildContext context,
    {required SceneDetailEntity scene}) {
  return showModalPopUp(context, builder: (BuildContext context) {
    return SceneProductModal(scene: scene);
  });
}

class SceneProductModal extends StatelessWidget {
  final SceneDetailEntity scene;
  const SceneProductModal({Key? key, required this.scene}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      builder: (BuildContext context) {
        return GetBuilder<SceneProductController>(
            autoRemove: false,
            builder: (_) {
              _.scene = scene;
              SceneDecorationEntity decoration = scene.decoration;
              return Scaffold(
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: R.dimen.dp20),
                        child: Row(
                          children: [
                            ChimeraImage(
                              decoration.image,
                              width: R.dimen.dp60,
                              height: R.dimen.dp60,
                              fit: BoxFit.fitHeight,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: R.dimen.dp15),
                              child: Text(
                                "${decoration.name}",
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    color: R.color.ff1b1b1b,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int i) =>
                            Divider(),
                        itemBuilder: (BuildContext context, int i) {
                          SceneProductEntity p = decoration.products[i];
                          return Container(
                            margin: EdgeInsets.only(top: R.dimen.dp20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (p.productType is CustomProductType)
                                  SceneCustomProductCard(
                                    product: p,
                                    onSelect: _.select,
                                    onModify: _.modifyAttribute,
                                  ),
                                if (p.productType is FinishedProductType)
                                  SceneFinishedProductCard(
                                    product: p,
                                    onSelect: _.select,
                                    onCountChanged: _.changeCount,
                                    onModify:
                                        _.openFinishedProductAttributeModal,
                                  )
                              ],
                            ),
                          );
                        },
                        itemCount: decoration.products.length,
                      ))
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  decoration:
                      BoxDecoration(color: R.color.ffffffff, boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset(0, -1),
                        color: Colors.black.withAlpha(18))
                  ]),
                  height: kBottomNavigationBarHeight +
                      MediaQuery.of(context).padding.bottom,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom,
                      left: R.dimen.dp20,
                      right: R.dimen.dp20),
                  margin: EdgeInsets.only(
                    top: R.dimen.dp7,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: R.dimen.dp8),
                            child: Text(
                              "预计:",
                              style: TextStyle(
                                fontSize: R.dimen.sp12,
                              ),
                            ),
                          ),
                          Text("¥${_.scene.totalPrice.toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: R.dimen.sp15,
                                  color: R.color.ffff5005))
                        ],
                      ),
                      ProductActionBar(
                        onAddToCart: _.addToCart,
                        onPurchase: _.buy,
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
