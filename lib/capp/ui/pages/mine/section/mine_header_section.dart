import 'package:flutter/material.dart';
import 'package:taoju5/capp/entity/user/user_entity.dart';
import 'package:taoju5/capp/res/R.dart';

class CMineHeaderSection extends StatelessWidget {
  final UserEntity user;
  const CMineHeaderSection({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: R.dimen.dp16),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.avatar),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(
                    fontSize: R.dimen.sp15, fontWeight: FontWeight.w500),
              ),
              Container(
                  margin: EdgeInsets.only(top: R.dimen.dp8),
                  child: Text(
                    "账号:${user.account}(默认注册手机号)",
                    style: TextStyle(
                        fontSize: R.dimen.sp12, color: R.color.subtitleColor),
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
