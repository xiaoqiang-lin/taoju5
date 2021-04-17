import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomerTableSkeleton extends StatelessWidget {
  const CustomerTableSkeleton({Key key}) : super(key: key);
  final Color bgColor = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: Column(
        children: List.generate(
            18,
            (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    children: [
                      Container(
                        color: bgColor,
                        width: MediaQuery.of(context).size.width,
                        height: 36,
                      ),
                      Divider()
                    ],
                  ),
                )),
      ),
    );
  }
}
