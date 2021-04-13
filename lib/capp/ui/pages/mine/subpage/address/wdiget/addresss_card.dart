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
      child: Column(
        children: [
          Row(
            children: [
              Text(address.username),
              Text(address.tel),
              Spacer(),
              Text("编辑"),
              Icon(R.icon.next)
            ],
          ),
          Wrap(
            children: [
              Text("默认"),
              Text(address.description),
            ],
          )
        ],
      ),
    );
  }
}
