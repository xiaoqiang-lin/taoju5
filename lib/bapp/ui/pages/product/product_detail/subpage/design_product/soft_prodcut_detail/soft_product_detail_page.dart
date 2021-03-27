/*
 * @Description: 软装方案详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:47:50
 * @LastEditTime: 2021-01-10 14:36:47
 */
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/product/design_product/design_product_modal.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/mixin_product_grid_view.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_customer_choose_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

class SoftProductDetailPage extends StatelessWidget {
  const SoftProductDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("软装方案"),
        actions: [
          XCustomerChooseButton(
            event: ChooseCustomerEventModel(fromUrl: Get.currentRoute),
          )
        ],
      ),
      body: GetBuilder<SoftProductDetailController>(
        builder: (_) {
          return XLoadStateBuilder(
            loadState: _.loadState,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int i) {
                      DesignProductModel e = _.productList[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          XPhotoViewer(url: e.image),
                          Text(
                            e.name,
                            style: TextStyle(
                                fontSize: BDimens.sp28,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: BDimens.gap8),
                              child: Text(
                                e.fullName,
                                style: TextStyle(fontSize: BDimens.sp28),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "¥${e.totalPrice}",
                                style: TextStyle(
                                    fontSize: BDimens.sp36,
                                    color: BColors.highLightColor),
                              ),
                              ElevatedButton(
                                  onPressed: () => showDesignProductModal(
                                      id: _.id, fromId: _.productId),
                                  child: Text("立即购买"))
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: BDimens.gap32),
                            child: Text(
                              "包含商品",
                              style: TextStyle(
                                  color: BColors.titleColor,
                                  fontSize: BDimens.sp28,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          MixinProductGridView(productList: e.productList)
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int i) =>
                        Divider(),
                    itemCount: _.productList.length),
              );
            },
          );
        },
      ),
    );
  }
}
