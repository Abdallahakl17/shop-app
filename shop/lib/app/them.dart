import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/app/app_color.dart';

ThemeData lightthemm() => ThemeData(
       
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColor.titleColor),
      textTheme: TextTheme(
          bodySmall: TextStyle(
              color: AppColor.titleColor,
              fontSize: 15 ,
              fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(
              fontSize: 18,
              color: AppColor.whaitColor,
              fontWeight: FontWeight.w500)),
      primaryColor: AppColor.mainColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 20, selectedItemColor: AppColor.mainColor),
      scaffoldBackgroundColor: AppColor.whaitColor,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.greyColor,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: AppColor.scfColor,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColor.whaitColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(
            color: AppColor.whaitColor,
          )),
    );
