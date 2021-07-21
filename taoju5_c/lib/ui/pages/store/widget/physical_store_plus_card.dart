/*
 * @Description: 门店卡片
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:08:22
 * @LastEditTime: 2021-07-21 17:14:47
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class PhysicialStorePlusCard extends StatelessWidget {
  final StoreEntity store;
  const PhysicialStorePlusCard({Key? key, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.storeDetail + "/${store.id}"),
      child: Container(
        width: R.dimen.width - R.dimen.dp20 * 2,
        margin: EdgeInsets.only(
            left: R.dimen.dp20, right: R.dimen.dp20, bottom: R.dimen.dp15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(R.dimen.sp7),
            border: Border.all(color: R.color.ffe5e5e5)),
        child: Column(
          children: [
            ChimeraImage(
              store.image,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(R.dimen.sp7),
                  topRight: Radius.circular(R.dimen.sp7)),
              height: (R.dimen.width - R.dimen.dp20 * 2) * (170 / 335),
              width: R.dimen.width - R.dimen.dp20 * 2,
              fit: BoxFit.fill,
            ),
            Container(
              transform: Matrix4.translationValues(0, -R.dimen.dp36, 0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(R.dimen.dp60 / 2),
                    child: Image.network(
                      store.avatar,
                      width: R.dimen.dp60,
                      height: R.dimen.dp60,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: R.dimen.dp12),
                    child: Text(
                      "${store.name}",
                      style: TextStyle(
                          fontSize: R.dimen.sp14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: R.dimen.dp8, bottom: R.dimen.dp18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(R.image.starLevel),
                        Container(
                          margin: EdgeInsets.only(
                            left: R.dimen.dp3,
                            right: R.dimen.dp10,
                          ),
                          child: Text(
                            "${store.score}分",
                            style: TextStyle(
                                color: R.color.ff5005, fontSize: R.dimen.sp10),
                          ),
                        ),
                        Text(
                          "${store.description}",
                          style: TextStyle(
                              color: R.color.ff00000, fontSize: R.dimen.sp10),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
