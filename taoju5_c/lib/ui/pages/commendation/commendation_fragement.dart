/*
 * @Description:  推荐页面
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:23:58
 * @LastEditTime: 2021-07-28 17:50:16
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:taoju5_c/ui/pages/product/component/product_staggered_card.dart';
import 'package:get/get.dart';

class CommendationFragment extends StatelessWidget {
  final ScrollController? scrollController;
  final Widget? header;

  final String? tag;
  final Map? arguments;
  const CommendationFragment(
      {Key? key,
      this.scrollController,
      this.header,
      required this.tag,
      this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header == null ? SizedBox.shrink() : header!,
        PullToRefreshStaggeredGridViewBuilder<CommendationController,
            ProductEntity>(
          // shrinkWrap: true,
          enablePullDown: false,

          initState: (_) {
            Get.find<CommendationController>(tag: tag).arguments =
                arguments ?? {};
          },
          loadingBuilder: (_) => SizedBox.shrink(),
          scrollController: scrollController,
          tag: tag,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          itemBuilder: (ProductEntity item) =>
              ProductStaggeredCard(product: item),
          staggeredTileBuilder: (index) {
            return StaggeredTile.fit(2);
          },
          crossAxisCount: 4,
          mainAxisSpacing: R.dimen.dp15,
          crossAxisSpacing: R.dimen.dp16,
        ),
      ],
    );
  }
}
