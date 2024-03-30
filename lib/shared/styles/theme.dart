import 'package:flutter/material.dart';


import 'colors.dart';

ThemeData lightTheme = ThemeData(


  scaffoldBackgroundColor:Colors.white,
  platform: TargetPlatform.iOS,
  fontFamily: "Schyler",
  primaryColor: AppColors.primaryColor,
 // primarySwatch: Colors.green,
  iconTheme: const IconThemeData(color: AppColors.primaryColor),
  buttonTheme: const ButtonThemeData(
    splashColor: AppColors.primaryColor,
    focusColor: AppColors.primaryColor,
  ),

  // textTheme: const TextTheme(
  //     headline1: TextStyle(
  //       color: AppColors.blueDark,
  //     ),
  //     headline2: TextStyle(
  //       color: AppColors.blueDark,
  //     ),
  //     bodyText2: TextStyle(
  //       color: AppColors.blueDark,
  //     ),
  //     subtitle1: TextStyle(
  //       color: AppColors.blueDark,
  //     ),
  //   ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
        titleTextStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,

        ),)
  //       systemOverlayStyle: SystemUiOverlayStyle(
  //           statusBarColor: AppColors.primaryColor,
  //           statusBarIconBrightness: Brightness.light)),
  //   sliderTheme: const SliderThemeData(
  //       valueIndicatorColor: AppColors.primaryColor,
  //       inactiveTickMarkColor: AppColors.slidergrey,
  //       activeTrackColor: AppColors.primaryColor,
  //       activeTickMarkColor: AppColors.primaryColor,
  //       disabledInactiveTrackColor: Colors.blue,
  //       thumbColor: AppColors.primaryColor,
  //       rangeTrackShape: RectangularRangeSliderTrackShape(),
  //       rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
  //       rangeTickMarkShape: RoundRangeSliderTickMarkShape(tickMarkRadius: 1.2),
  //       rangeThumbShape: RoundRangeSliderThumbShape(
  //         disabledThumbRadius: 10,
  //         enabledThumbRadius: 10,
  //       )));
);


    //       systemOverlayStyle: SystemUiOverlayStyle(
    //           statusBarColor: AppColors.primaryColor,
    //           statusBarIconBrightness: Brightness.light)),
    //   sliderTheme: const SliderThemeData(
    //       valueIndicatorColor: AppColors.primaryColor,
    //       inactiveTickMarkColor: AppColors.slidergrey,
    //       activeTrackColor: AppColors.primaryColor,
    //       activeTickMarkColor: AppColors.primaryColor,
    //       disabledInactiveTrackColor: Colors.blue,
    //       thumbColor: AppColors.primaryColor,
    //       rangeTrackShape: RectangularRangeSliderTrackShape(),
    //       rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
    //       rangeTickMarkShape: RoundRangeSliderTickMarkShape(tickMarkRadius: 1.2),
    //       rangeThumbShape: RoundRangeSliderThumbShape(
    //         disabledThumbRadius: 10,
    //         enabledThumbRadius: 10,
    //       )));

