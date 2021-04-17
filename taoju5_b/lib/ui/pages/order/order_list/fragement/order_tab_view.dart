import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_b/domain/model/order/order_model.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/order/order_list/widgets/order_card.dart';

class OrderTabView extends StatelessWidget {
  final List<OrderModel> orderList;
  final bool shrinkWrap;
  final RefreshController refreshController;
  final ScrollController scrollController;
  final Function onLoading;
  final Function onRefresh;
  final bool enablePullDown;
  final bool enablePullUp;

  const OrderTabView(
      {Key key,
      this.shrinkWrap = true,
      @required this.refreshController,
      this.scrollController,
      this.onLoading,
      this.onRefresh,
      this.enablePullDown = true,
      this.enablePullUp = true,
      @required this.orderList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int i) {
            return Divider(
              height: BDimens.gap16,
            );
          },
          itemCount: orderList.length,
          itemBuilder: (BuildContext context, int i) {
            OrderModel e = orderList[i];
            return OrderCard(order: e);
          }),
    );
  }
}
