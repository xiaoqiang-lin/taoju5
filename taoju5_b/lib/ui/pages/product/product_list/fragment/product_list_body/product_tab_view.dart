import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:taoju5_b/domain/model/product/product_model.dart';
import 'package:taoju5_b/ui/pages/product/product_list/fragment/product_list_body/product_grid_mode_section.dart';
import 'package:taoju5_b/ui/pages/product/product_list/fragment/product_list_body/product_list_mode_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum ProductViewMode { grid, list }

class ProductTabView extends StatelessWidget {
  final ProductViewMode mode;
  final List<ProductModel> productList;
  final bool shrinkWrap;
  final RefreshController refreshController;
  final ScrollController scrollController;
  final Function onLoading;
  final Function onRefresh;
  final bool enablePullDown;
  final bool enablePullUp;
  const ProductTabView(
      {Key key,
      @required this.mode,
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
    return PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: mode == ProductViewMode.grid
            ? ProductGridModeSection(
                productList: productList,
                refreshController: refreshController,
                scrollController: scrollController,
                onLoading: onLoading,
                onRefresh: onRefresh,
                enablePullDown: enablePullDown,
                enablePullUp: enablePullUp,
              )
            : ProductListModeSection(
                productList: productList,
                refreshController: refreshController,
                scrollController: scrollController,
                onLoading: onLoading,
                onRefresh: onRefresh,
                enablePullDown: enablePullDown,
                enablePullUp: enablePullUp,
              ));
  }
}
