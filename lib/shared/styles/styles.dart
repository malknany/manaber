import 'package:flutter/material.dart';



abstract class AppTextStyles {
  /// - weight: w200
  /// - family: cairo
  static TextStyle boldTitles =
  const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, height: 1.7);

  static TextStyle boldTitlesButton =
  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,);

  /// - weight: w300
  /// - family: cairo
  static TextStyle w300 =
  const TextStyle(fontWeight: FontWeight.w300, fontSize: 30);

  /// - weight: w400
  /// - family: cairo
  // static TextStyle hittext = TextStyle(
  //     color: AppColors.Bluehint, fontWeight:FontWeight.w600,fontSize: 14);

  /// - weight: w500
  /// - family: cairo
  static TextStyle smTitles =
  const TextStyle(fontWeight: FontWeight.w500, fontSize: 20);

  /// - weight: w600
  /// - family: cairo
  static TextStyle w600 = const TextStyle(fontWeight: FontWeight.w600);

  /// - weight: w700
  /// - family: cairo
  static TextStyle lrTitles =
  const TextStyle(fontWeight: FontWeight.w700, fontSize: 22);

  /// - weight: w800
  /// - family: cairo
  static TextStyle w800 = const TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  /// - family: cairo
  static TextStyle textsmbold =
  const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, height: 2.5);
}
