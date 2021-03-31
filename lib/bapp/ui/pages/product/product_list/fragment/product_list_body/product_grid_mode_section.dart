/*
 * @Description:商品列表 网格模式视图
 * @Author: iamsmiling
 * @Date: 2021-01-08 13:17:59
 * @LastEditTime: 2021-01-26 11:04:59
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/widgets/product_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductGridModeSection extends StatefulWidget {
  final List<ProductModel> productList;
  final bool shrinkWrap;
  final RefreshController refreshController;
  final ScrollController scrollController;
  final Function onLoading;
  final Function onRefresh;
  final bool enablePullDown;
  final bool enablePullUp;
  const ProductGridModeSection(
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
  _ProductGridModeSectionState createState() => _ProductGridModeSectionState();
}

class _ProductGridModeSectionState extends State<ProductGridModeSection> {
  RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    refreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: widget.refreshController ?? refreshController,
      scrollController: widget.scrollController,
      onLoading: widget.onLoading,
      onRefresh: widget.onRefresh,
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp,
      cacheExtent: 480,
      child: GridView.builder(
          shrinkWrap: widget.shrinkWrap,
          controller: widget.scrollController,
          itemCount: widget.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.84,
            // crossAxisSpacing: 24,
          ),
          itemBuilder: (BuildContext context, int i) {
            return ProductGridCard(product: widget.productList[i]);
          }),
    );
  }
}
