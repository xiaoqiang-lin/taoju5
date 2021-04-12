import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/design_product_modal/design_product_modal_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';
import 'package:get/get.dart';

class DesignProductAddToCartParamsModel {
  List<ProductMixinModel> productList;

  Map get params {
    String clientId = Get.find<CustomerProviderController>().id;
    Map map = {"client_uid": clientId};
    List<Map> list = productList?.map((e) => e.toJson())?.toList();
    map.addAll({"cart_list": list});
    return map;
  }
}

class DesignFinishedProductCard extends StatelessWidget {
  final ProductMixinModel product;
  const DesignFinishedProductCard({Key key, @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignProductModalController>(
        id: "${product?.id}",
        builder: (_) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 180.w,
                      height: 180.w,
                      child: XPhotoViewer(
                          url:
                              "${product?.currentSkuModel?.image ?? product.image}"),
                    ),
                    Expanded(
                        child: Container(
                      height: 180.w,
                      margin: EdgeInsets.only(left: BDimens.gap24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: BDimens.gap8),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: BDimens.sp28,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "已选:${product.currentSkuModel?.name ?? product?.currentSkuDescription}",
                            style: TextStyle(
                                color: BColors.descriptionTextColor,
                                fontSize: BDimens.sp28),
                          ),
                          Spacer(),
                          Text(
                            "¥${product.currentSkuModel?.price ?? product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: BColors.highLightColor,
                                fontSize: BDimens.sp28),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
                for (ProductSpecModel spec in product.specList)
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: BDimens.gap16, vertical: BDimens.gap16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: BDimens.gap24),
                          child: Text(
                            "${spec.name}:",
                            style: TextStyle(
                                fontSize: BDimens.sp24,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: BDimens.gap16),
                          child: Wrap(
                            runSpacing: BDimens.gap16,
                            spacing: BDimens.gap32,
                            children: [
                              for (ProductSpecOptionModel option
                                  in spec.optionList)
                                XCheckButton(
                                    isChecked: option.isChecked,
                                    onPresss: () => _.select(
                                        id: "${product?.id}",
                                        spec: spec,
                                        option: option),
                                    child: Text("${option.name}"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap16),
                    child: Divider())
              ],
            ),
          );
        });
  }
}
