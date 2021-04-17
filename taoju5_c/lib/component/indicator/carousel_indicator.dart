import 'package:flutter/material.dart';

class CarouselIndicator extends StatefulWidget {
  CarouselIndicator({Key key}) : super(key: key);

  @override
  _CarouselIndicatorState createState() => _CarouselIndicatorState();
}

class _CarouselIndicatorState extends State<CarouselIndicator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              width: currentIndex == 0 ? 20 : 5,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
            child: AnimatedContainer(
                width: currentIndex != 0 ? 20 : 5,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                duration: const Duration(milliseconds: 375)),
          )
        ],
      ),
    );
  }
}
