/*
 * @Description: 　选品页面
 * @Author: iamsmiling
 * @Date: 2021-07-01 10:26:33
 * @LastEditTime: 2021-07-01 15:52:02
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/product_list/fragment/single_category_product_list_fragment.dart';
import 'package:taoju5_c/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_selectable_list/dialog/product_select_tip_dialog.dart';

class ProductSelectableListPage extends StatelessWidget {
  const ProductSelectableListPage({Key? key}) : super(key: key);

  _initState(_, BuildContext context) {
    if (Get.arguments is ProductSelectTipEntity) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        openProductSelectTipDialog(context, Get.arguments);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListParentController>(
        initState: (_) => _initState(_, context),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: Text(_.category.name),
                actions: [Image.asset(R.image.find)],
              ),
              body: FutureLoadStateBuilder<ProductListParentController>(
                controller: _,
                loadingBuilder: (BuildContext context) => SizedBox.shrink(),
                builder: (_) {
                  return SingleCategoryProductListFragment();
                },
              ));
        });
  }
}
