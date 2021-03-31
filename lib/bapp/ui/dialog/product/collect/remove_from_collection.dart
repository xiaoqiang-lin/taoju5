import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_collection_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/product/collection/collection_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

Future showRemoveFromCollection({ProductCollectionModel product}) {
  return showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return GetBuilder<CollectionController>(
          builder: (_) {
            return AlertDialog(
              title: Text(
                "你确定要从收藏夹中移除当前商品吗?",
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: Get.back,
                        child: Text("取消"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: BDimens.gap24),
                        child: XFutureButton(
                            onFuture: () =>
                                _.removeFromCollection(product: product),
                            onSuccess: Get.back,
                            child: Text("确定")),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      });
}
