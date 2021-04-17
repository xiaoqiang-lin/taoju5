/*
 * @Description: 商品列表 列表模式视图
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:09:44
 * @LastEditTime: 2021-01-19 16:14:48
 */
import 'package:flutter/material.dart';
import 'package:taoju5_b/domain/model/product/product_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/product/widgets/product_onsale_tag.dart';

class ProductListModeSection extends StatelessWidget {
  final List<ProductModel> productList;
  final bool shrinkWrap;
  final RefreshController refreshController;
  final ScrollController scrollController;
  final Function onLoading;
  final Function onRefresh;
  final bool enablePullDown;
  final bool enablePullUp;

  const ProductListModeSection(
      {Key key,
      @required this.productList,
      this.shrinkWrap = true,
      this.refreshController,
      this.scrollController,
      this.onLoading,
      this.onRefresh,
      this.enablePullDown = true,
      this.enablePullUp = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      scrollController: scrollController,
      onLoading: onLoading,
      onRefresh: onRefresh,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      child: ListView.builder(
          shrinkWrap: shrinkWrap,
          itemCount: productList.length,
          controller: scrollController,
          itemBuilder: (BuildContext context, int i) {
            ProductModel e = productList[i];
            return GestureDetector(
              onTap: () => Get.toNamed(BAppRoutes.productDetail + "/${e.id}",
                  arguments: Get.arguments),
              child: Container(
                color: Get.theme.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                child: Column(
                  children: [
                    Image.network(
                      e.image,
                      width: Get.width,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
                      child: Text(
                        e.name,
                        style: TextStyle(fontSize: BDimens.sp30),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${e.price?.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: BDimens.sp32,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          e.unit,
                          style: TextStyle(
                              fontSize: BDimens.sp24,
                              color: BColors.greyTextColor),
                        ),
                        Visibility(
                          visible: e.isOnsale,
                          child: ProductOnSaleTag(
                            margin: EdgeInsets.only(left: BDimens.gap32),
                            padding:
                                EdgeInsets.symmetric(horizontal: BDimens.gap4),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
