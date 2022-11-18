import 'package:flutter/material.dart';

class AppThemeData {
  late ThemeData themeData;
  final Color primaryColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color onGroundColor;
  final Color onGroundColorLow;
  AppThemeData({
    required this.themeData,
    required this.primaryColor,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onGroundColor,
    required this.onGroundColorLow,
  });
}
