import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/app/app_color.dart';

ThemeData lightthemm() => ThemeData(
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(AppColor.blackainColor))),
      iconTheme: IconThemeData(color: AppColor.blackainColor),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColor.titleColor),
      textTheme: TextTheme(
          bodySmall: TextStyle(
              color: AppColor.titleColor,
              fontSize: 15,
              fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(
              fontSize: 18,
              color: AppColor.whaitColor,
              fontWeight: FontWeight.w500)),
      primaryColor: AppColor.mainColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: AppColor.greyColor,
          unselectedIconTheme: IconThemeData(color: AppColor.greyColor),
          selectedIconTheme: IconThemeData(color: AppColor.scfColor),
          selectedLabelStyle: TextStyle(color: AppColor.scfColor),
          elevation: 20,
          selectedItemColor: AppColor.mainColor),
      scaffoldBackgroundColor: AppColor.whaitColor,
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColor.blackainColor),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.greyColor,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColor.whaitColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(
            color: AppColor.whaitColor,
          )),
    );
