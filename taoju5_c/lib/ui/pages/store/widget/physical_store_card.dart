/*
 * @Description: 门店卡片
 * @Author: iamsmiling
 * @Date: 2021-06-08 16:08:22
 * @LastEditTime: 2021-07-21 16:50:25
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class PhysicialStoreCard extends StatelessWidget {
  final StoreEntity store;
  const PhysicialStoreCard({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.storeDetail + "/${store.id}"),
      child: Container(
        width: R.dimen.dp200,
        height: R.dimen.dp158,
        margin: EdgeInsets.only(right: R.dimen.dp10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(R.dimen.sp7),
            border: Border.all(color: const Color(0xFFE5E5E5))),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                ChimeraImage(
                  store.image,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(R.dimen.sp7),
                      topRight: Radius.circular(R.dimen.sp7)),
                  height: R.dimen.dp90,
                  width: R.dimen.dp200,
                  fit: BoxFit.fill,
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp20),
                  child: Text(
                    "${store.name}",
                    style: TextStyle(
                        fontSize: R.dimen.sp12, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: R.dimen.dp5),
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
            Positioned(
              top: R.dimen.dp64,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(R.dimen.dp44 / 2),
                child: Image.network(
                  store.avatar,
                  width: R.dimen.dp44,
                  height: R.dimen.dp44,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
