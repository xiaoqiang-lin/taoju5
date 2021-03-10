/*
 * @Description: 商品材料信息
 * @Author: iamsmiling
 * @Date: 2021-01-20 15:34:56
 * @LastEditTime: 2021-01-20 16:43:32
 */
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/x_title_bar.dart';

class ProductMaterialSection extends StatelessWidget {
  final List<ProductMaterialModel> materialList;
  const ProductMaterialSection({Key key, @required this.materialList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(materialList),
      child: Container(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.only(top: BDimens.gap16),
        padding: EdgeInsets.symmetric(
            horizontal: BDimens.gap32, vertical: BDimens.gap16),
        child: Column(
          children: [
            XTitleBar(
              title: "商品信息",
              trailing: SizedBox.shrink(),
            ),
            Container(
              child: Column(
                children: [
                  for (ProductMaterialModel e in materialList)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: BDimens.gap12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              e.key,
                              style: TextStyle(
                                  fontSize: BDimens.sp28,
                                  color: BColors.greyTextColor),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              e.value,
                              style: TextStyle(
                                fontSize: BDimens.sp28,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
