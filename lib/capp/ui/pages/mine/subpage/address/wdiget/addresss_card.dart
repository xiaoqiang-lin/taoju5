import 'package:flutter/material.dart';
import 'package:taoju5/capp/entity/address/address_entity.dart';
import 'package:taoju5/capp/res/R.dart';

class CAddressCard extends StatelessWidget {
  final AddressEntity address;
  const CAddressCard({Key key, @required this.address})
      : assert(address != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: R.dimen.dp20, horizontal: R.dimen.dp24),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  address.username,
                  style: TextStyle(
                      fontSize: R.dimen.sp13, fontWeight: FontWeight.w600),
                ),
                Container(
                    margin: EdgeInsets.only(left: R.dimen.dp10),
                    child: Text(
                      address.tel,
                      style: TextStyle(
                          fontSize: R.dimen.sp13, color: R.color.greyTextColor),
                    )),
                Spacer(),
                Text(
                  "编辑",
                  style: TextStyle(
                      fontSize: R.dimen.sp12, color: R.color.greyTextColor),
                ),
                Icon(R.icon.next)
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: R.dimen.dp3),
                    child: Text(
                      "默认",
                      style: TextStyle(
                          fontSize: R.dimen.sp13, color: R.color.primaryColor),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(R.dimen.sp2),
                        color: R.color.primaryColor.withOpacity(.08)),
                  ),
                ),
                WidgetSpan(
                  child: Text(
                    address.description,
                    softWrap: false,
                    maxLines: 3,
                    style: TextStyle(fontSize: R.dimen.sp13),
                  ),
                ),
              ],
            ),
            softWrap: false,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
