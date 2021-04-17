/*
 * @Description: 收藏页面
 * @Author: iamsmiling
 * @Date: 2021-01-07 17:40:53
 * @LastEditTime: 2021-01-07 17:44:55
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/product_collection_model.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/res/b_icons.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/dialog/product/collect/remove_from_collection.dart';
import 'package:taoju5_b/ui/pages/product/collection/collection_skeleton.dart';
import 'package:taoju5_b/ui/widgets/base/x_loadstate_builder.dart';

import 'collection_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:autolist/autolist.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏夹"),
      ),
      body: GetBuilder<CollectionController>(
        builder: (_) {
          return XLoadStateBuilder(
              loadState: _.loadState,
              retry: _.loadData,
              loadingWidget: CollectionSkeleton(),
              builder: (BuildContext context) {
                return AutoList(
                  duration: const Duration(milliseconds: 375),
                  items: _.collectionList,
                  itemBuilder:
                      (BuildContext context, ProductCollectionModel product) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                          BAppRoutes.productDetail + "/${product.productId}"),
                      child: Slidable(
                        key: ValueKey(product.productId),
                        actionPane: SlidableBehindActionPane(),
                        secondaryActions: [
                          IconSlideAction(
                            caption: '取消收藏',
                            color: Colors.red,
                            icon: BIcons.del,
                            onTap: () =>
                                showRemoveFromCollection(product: product),
                          ),
                        ],
                        child: Container(
                          color: Get.theme.primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: BDimens.gap32,
                              vertical: BDimens.gap32),
                          child: Row(
                            children: [
                              Container(
                                width: 180.w,
                                height: 180.w,
                                child: Image.network(product.image),
                                margin: EdgeInsets.only(right: BDimens.gap24),
                              ),
                              Expanded(
                                  child: Container(
                                height: 180.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.productName,
                                      style: TextStyle(
                                          fontSize: BDimens.sp28,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      product.categoryName,
                                      style: TextStyle(
                                          color: BColors.greyTextColor,
                                          fontSize: BDimens.sp26),
                                    ),
                                    Spacer(),
                                    Text(
                                      "¥${product.productPrice.toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: BDimens.sp26,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
