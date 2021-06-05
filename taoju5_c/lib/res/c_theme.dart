// part of R;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_c/component/indicator/fixed_size_tab_indicator.dart';

import 'R.dart';

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @factory
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return new NoSplash(
        controller: controller,
        referenceBox: referenceBox,
        color: Colors.transparent);
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
    VoidCallback? onRemoved,
  }) : super(
            controller: controller,
            referenceBox: referenceBox,
            onRemoved: onRemoved,
            color: Colors.transparent);
  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}

class CTheme {
  static CTheme _singleton = CTheme._();
  // ignore: unused_element
  CTheme._();

  factory CTheme() => _singleton;

  final ThemeData lightTheme = ThemeData(
      fontFamily: "PingFang",
      iconTheme: IconThemeData(size: R.dimen.sp16, color: R.color.ffffffff),
      scaffoldBackgroundColor: R.color.ffffffff,
      splashFactory: const NoSplashFactory(),
      highlightColor: R.color.transparent,
      toggleButtonsTheme: ToggleButtonsThemeData(),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(R.color.ffee9b5f)),
      buttonBarTheme: ButtonBarThemeData(),
      dividerTheme:
          DividerThemeData(space: R.dimen.dp1, color: R.color.ffe5e5e5),
      textSelectionTheme: TextSelectionThemeData(cursorColor: R.color.ffee9b5f),
      toggleableActiveColor: R.color.ffee9b5f,
      inputDecorationTheme: InputDecorationTheme(
          isCollapsed: true,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: R.color.ffe5e5e5)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.color.ffe5e5e5)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.color.ffe5e5e5)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.color.ffe5e5e5)),
          errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: R.dimen.sp10,
              color: R.color.ffff0000),
          hintStyle:
              TextStyle(color: R.color.ffc7c8cc, fontSize: R.dimen.sp12)),
      // toggleButtonsTheme: ToggleButtonsThemeData(color: R.color.ffee9b5f),
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: R.color.ff1b1b1b,
              fontSize: R.dimen.sp12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(R.dimen.sp8))),
      primaryTextTheme: TextTheme(
          headline6: TextStyle(
              // foreground: Paint()..strokeWidth = .1,
              // background: Paint()..strokeWidth = 1,
              fontSize: R.dimen.sp18,
              fontWeight: FontWeight.w600),
          bodyText2: TextStyle(color: R.color.ff333333)),
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: R.color.ffffffff,
          titleTextStyle:
              TextStyle(fontSize: R.dimen.sp10, fontWeight: FontWeight.w500)),
      tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: R.color.ff999999,
              fontSize: R.dimen.sp13),
          labelColor: R.color.ffee9b5f,
          unselectedLabelColor: R.color.ff333333,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: R.dimen.sp13,
              color: R.color.ff333333),

          // labelPadding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          indicator: FixedSizeUnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: R.dimen.dp44),
              borderSide:
                  BorderSide(width: R.dimen.dp3, color: R.color.ffee9b5f))),
      splashColor: R.color.transparent,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      textTheme: TextTheme(
          button:
              TextStyle(fontSize: R.dimen.sp15, fontWeight: FontWeight.w500)),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: R.color.ffee9b5f),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(R.color.transparent),
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(R.color.transparent),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return R.color.ffee9b5f_6;
            }
            return R.color.ffee9b5f;
          }),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(R.color.transparent),
              shape: MaterialStateProperty.all(StadiumBorder()),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return R.color.ffee9b5f_4;
                }
                return R.color.ffee9b5f;
              }),
              foregroundColor: MaterialStateProperty.all(Colors.white),

              // padding: MaterialStateProperty.all(
              //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                return BorderSide(color: R.color.ffee9b5f);
              }),
              minimumSize:
                  MaterialStateProperty.all(Size(R.dimen.dp60, R.dimen.dp30)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(R.color.transparent),
              shape: MaterialStateProperty.all(StadiumBorder()),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return R.color.ffee9b5f;
              }),
              // padding: MaterialStateProperty.all(
              //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                return BorderSide(color: R.color.ffee9b5f);
              }),
              minimumSize:
                  MaterialStateProperty.all(Size(R.dimen.dp60, R.dimen.dp30)))),
      switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.all<Color>(R.color.ffee9b5f),
          thumbColor: MaterialStateProperty.all<Color>(R.color.ffee9b5f),
          trackColor: MaterialStateProperty.all<Color>(R.color.ffee9b5f)),
      primaryColor: R.color.ffee9b5f,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: R.dimen.sp12),
          unselectedIconTheme: IconThemeData(size: R.dimen.sp12),
          selectedLabelStyle: TextStyle(fontSize: R.dimen.sp10),
          unselectedLabelStyle:
              TextStyle(fontSize: R.dimen.sp10, color: R.color.ffee9b5f),
          elevation: 10));
}
