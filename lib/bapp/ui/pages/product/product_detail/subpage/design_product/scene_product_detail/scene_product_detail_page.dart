/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:47:50
 * @LastEditTime: 2021-01-28 14:16:05
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_skeleton.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_cart_button.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_customer_choose_button.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_thumbnail_card.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'scene_product_detail_controller.dart';
import 'widget/x_tag_chip.dart';

class SceneProductDetailPage extends StatelessWidget {
  const SceneProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("相关场景"),
        actions: [XCustomerChooseButton()],
      ),
      body: GetBuilder<SceneProductDetailController>(
        tag: Get.parameters["id"],
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              loadingWidget: SceneProductDetailSkeleton(),
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XPhotoViewer(
                          url: _.product.image,
                          bigImageUrl: _.product.bigImage,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: BDimens.gap32),
                          child: Text(
                            _.product.description,
                            style: TextStyle(
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: BDimens.sp28,
                                color: BColors.descriptionTextColor),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: BDimens.gap12),
                          child: Row(
                            children: [
                              XTagChip(tag: _.product.room),
                              SizedBox(width: BDimens.gap24),
                              XTagChip(tag: _.product.style)
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: BDimens.gap32),
                          child: Text(
                            "相关商品",
                            style: TextStyle(
                                color: BColors.titleColor,
                                fontSize: BDimens.sp28,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _.product.productList.length,
                          itemBuilder: (BuildContext context, int i) {
                            ProductModel e = _.product.productList[i];
                            return Container(
                              child: Image.network(e.image),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: BDimens.gap36),
                                child: XCartButton(
                                  imageUrl: "assets/images/" +
                                      "product_detail_cart.png",
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("立即购买"))
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: BDimens.gap32),
                          child: Text(
                            "场景推荐",
                            style: TextStyle(
                                color: BColors.titleColor,
                                fontSize: BDimens.sp28,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: _.sceneList.length,
                          shrinkWrap: true,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12.0,
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(
                                  2, index == 0 ? 2.4 : 3.0),
                          itemBuilder: (BuildContext context, int i) {
                            DesignProductModel e = _.sceneList[i];
                            return GestureDetector(
                              onTap: () => Get.toNamed(
                                  BAppRoutes.sceneProductDetail + "/${e.id}"),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: BColors.cardBorderColor),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: i.isEven ? 5 : 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        child: CachedNetworkImage(
                                          imageUrl: e.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          for (ProductMixinModel item
                                              in e.productList)
                                            GestureDetector(
                                              onTap: () => Get.toNamed(
                                                  BAppRoutes.productDetail +
                                                      "/${item.id}"),
                                              child: XThumbnailCard(
                                                  child: Image.network(
                                                item.image,
                                                height: 48,
                                                // width: 48,
                                              )),
                                            )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: BDimens.gap16),
                                      margin: EdgeInsets.only(
                                          bottom: BDimens.gap16),
                                      child: Text("${e.room},${e.style}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: BDimens.sp28,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          physics: NeverScrollableScrollPhysics(),
                        )
                        // GridView.builder(gridDelegate: null, itemBuilder: null)
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
