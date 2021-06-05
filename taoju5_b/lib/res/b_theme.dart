/*
 * @Description: 主题相关配置
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:07:11
 * @LastEditTime: 2021-06-04 17:34:33
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_b/res/b_colors.dart';

import 'b_dimens.dart';
import 'b_styles.dart';

class BTheme {
  bool isDarkMode = false;

  static ThemeData lightTheme = ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: BColors.foregroundColor,
      ),
      brightness: Brightness.light,
      backgroundColor: BColors.foregroundColor,
      accentColor: BColors.foregroundColor,
      primaryColor: BColors.primaryColor,
      // primaryColor: Colors.yellow,
      buttonColor: BColors.buttonColor,
      primaryColorDark: BColors.primaryColor,
      primaryColorLight: BColors.foregroundColor,
      // primaryTextTheme: TextTheme(

      // ),

      iconTheme: IconThemeData(color: BColors.iconColor, size: BDimens.sp36),
      dividerTheme:
          DividerThemeData(color: BColors.dividerColor, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: BColors.titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500))),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: BColors.indicatorColor, width: 2),
          // insets: EdgeInsets.symmetric(horizontal: 8)
        ),

        labelPadding: EdgeInsets.only(
            bottom: BDimens.gap10, right: BDimens.gap10, left: BDimens.gap10),
        indicatorSize: TabBarIndicatorSize.label,
        // unselectedLabelStyle: BStyles.unselectedLabelStyle,
        // labelStyle: BStyles.selectedLabelStyle,
      ),
      textTheme: TextTheme(bodyText1: BStyles.bodyText1),
      // primarySwatch: MaterialColor(primary, swatch),
      timePickerTheme: TimePickerThemeData(
          dialHandColor: BColors.foregroundColor,
          backgroundColor: BColors.foregroundColor,
          dialBackgroundColor: BColors.foregroundColor,
          dayPeriodColor: BColors.foregroundColor,
          entryModeIconColor: BColors.foregroundColor),
      dialogTheme: DialogTheme(
          titleTextStyle: BStyles.dialogTitle,
          contentTextStyle: BStyles.dialogContent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                  color: BColors.primaryColor, fontSize: BDimens.sp28)),
              backgroundColor: MaterialStateProperty.all(BColors.buttonColor),
              // foregroundColor: MaterialStateProperty.all(BColors.buttonColor),
              // overlayColor: MaterialStateProperty.all(BColors.buttonColor),
              minimumSize: MaterialStateProperty.all(
                  Size(BDimens.minW144, BDimens.min32)))),
      disabledColor: Colors.grey,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return BColors.disabledColor;
                }
                return BColors.textColor;
              }),
              minimumSize: MaterialStateProperty.all(
                  Size(BDimens.minW144, BDimens.min32)),
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return TextStyle(
                      fontSize: BDimens.sp28, color: BColors.textColor);
                }

                return TextStyle(
                    fontSize: BDimens.sp28, color: BColors.textColor);
              }),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return BorderSide(color: BColors.disabledColor, width: 1);
                }
                return BorderSide(color: BColors.outlineBorderColor, width: 1);
              }))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(BColors.textColor),
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: BDimens.sp28, color: BColors.textColor)),
      )),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: BStyles.inputLabelText,
          hintStyle: BStyles.placeHolderText,
          focusColor: BColors.foregroundColor,
          hoverColor: BColors.foregroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: BDimens.gap32),

          // alignLabelWithHint: true,
          // isCollapsed: true,
          // isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: BColors.dividerColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: BColors.dividerColor))),
      // textButtonTheme: ,
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: BColors.primaryColor),
      buttonTheme: ButtonThemeData(
          disabledColor: BColors.disabledColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          buttonColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))));
}
