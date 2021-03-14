import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_photo_viewer.dart';

class DesignFinishedProductCard extends StatelessWidget {
  final ProductModel product;
  const DesignFinishedProductCard({Key key, @required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 180.w,
                height: 180.w,
                child: XPhotoViewer(url: product.image),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: BDimens.gap24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: BDimens.sp28, fontWeight: FontWeight.w500),
                    ),
                    // Text()
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
