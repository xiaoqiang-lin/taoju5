// part of R;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'R.dart';

class CTheme {
  static CTheme _singleton = CTheme._();
  // ignore: unused_element
  CTheme._();

  factory CTheme() => _singleton;

  final ThemeData lightTheme = ThemeData(
      fontFamily: "PingFang SC",
      iconTheme: IconThemeData(size: R.dimen.sp16, color: R.color.iconColor),
      scaffoldBackgroundColor: R.color.scaffoldBackgroundColor,
      toggleButtonsTheme: ToggleButtonsThemeData(),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(R.color.primaryColor)),
      buttonBarTheme: ButtonBarThemeData(),
      dividerTheme:
          DividerThemeData(space: R.dimen.dp1, color: R.color.dividerColor),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: R.color.primaryColor),
      toggleableActiveColor: R.color.primaryColor,
      inputDecorationTheme: InputDecorationTheme(

          // border: UnderlineInputBorder(
          //     borderSide:
          //         BorderSide(color: R.color.textFieldEnabledBorderColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: R.color.textFieldEnabledBorderColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: R.color.textFieldEnabledBorderColor)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.color.errorColor)),
          errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: R.dimen.sp10,
              color: R.color.errorColor),
          hintStyle:
              TextStyle(color: R.color.hintColor, fontSize: R.dimen.sp15)),
      // toggleButtonsTheme: ToggleButtonsThemeData(color: R.color.primaryColor),
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: R.color.dialogTitleColor,
              fontSize: R.dimen.sp12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(R.dimen.sp8))),
      primaryTextTheme:
          TextTheme(bodyText2: TextStyle(color: R.color.primaryTextColor)),
      appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: R.color.appBarColor,
          titleTextStyle:
              TextStyle(fontSize: R.dimen.sp14, fontWeight: FontWeight.bold)),
      tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: R.color.unselectedTabBarLabelColor,
              fontSize: R.dimen.sp13),
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: R.dimen.sp13),
          // labelPadding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: R.dimen.dp44),
              borderSide: BorderSide(
                  width: R.dimen.dp3, color: R.color.tabBarIndicatorColor))),
      splashColor: R.color.splashColor,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      textTheme: TextTheme(
          button:
              TextStyle(fontSize: R.dimen.sp15, fontWeight: FontWeight.w500)),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: R.color.primaryColor),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(R.color.splashColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return R.color.textButtonBackgroudColor;
              }),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return R.color.textButtonForegroudColor;
              }),

              // padding: MaterialStateProperty.all(
              //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),

              minimumSize:
                  MaterialStateProperty.all(Size(R.dimen.dp84, R.dimen.dp36)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(R.color.splashColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return R.color.elevatedButtonDisabledColor;
                }
                return R.color.primaryColor;
              }),
              foregroundColor: MaterialStateProperty.all(Colors.white),

              // padding: MaterialStateProperty.all(
              //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                return BorderSide(color: R.color.primaryColor);
              }),
              minimumSize:
                  MaterialStateProperty.all(Size(R.dimen.dp84, R.dimen.dp36)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(R.color.splashColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return R.color.primaryColor;
              }),
              // padding: MaterialStateProperty.all(
              //     EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return null;
                }
                return BorderSide(color: R.color.primaryColor);
              }),
              minimumSize:
                  MaterialStateProperty.all(Size(R.dimen.dp84, R.dimen.dp36)))),
      switchTheme: SwitchThemeData(
          overlayColor: MaterialStateProperty.all<Color>(R.color.primaryColor),
          thumbColor: MaterialStateProperty.all<Color>(R.color.primaryColor),
          trackColor: MaterialStateProperty.all<Color>(R.color.primaryColor)),
      primaryColor: R.color.primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: R.dimen.sp12),
          unselectedIconTheme: IconThemeData(size: R.dimen.sp12),
          selectedLabelStyle: TextStyle(fontSize: R.dimen.sp10),
          unselectedLabelStyle:
              TextStyle(fontSize: R.dimen.sp10, color: R.color.primaryColor),
          elevation: 10));
}
