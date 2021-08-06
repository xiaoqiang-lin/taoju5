/*
 * @Description: 软装卡片
 * @Author: iamsmiling
 * @Date: 2021-07-21 11:30:38
 * @LastEditTime: 2021-07-21 14:11:34
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_soft_decoration_section_entity.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class SoftDecorationCard extends StatelessWidget {
  final SoftDecorationEntity soft;
  final double? width;
  final double? height;
  const SoftDecorationCard(
      {Key? key, required this.soft, this.width = 90, this.height = 90})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.category + AppRoutes.productList,
          arguments: CategoryEntity(id: soft.categoryId, name: soft.name)),
      child: Container(
          width: width,
          height: height,
          // margin: EdgeInsets.only(right: R.dimen.dp10),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ChimeraImage(
                soft.image,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
              Container(
                decoration: BoxDecoration(
                    color: R.color.ff00000.withOpacity(.17),
                    borderRadius: BorderRadius.circular(R.dimen.sp7)),
                width: width,
                height: height,
              ),
              Text(
                "${soft.name}",
                style: TextStyle(
                    fontSize: R.dimen.sp14,
                    color: R.color.ffffffff,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
