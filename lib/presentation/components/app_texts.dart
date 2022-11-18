import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_theme.dart';

class BodyLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const BodyLarge({
    Key? key,
    required this.text,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: color ?? appTheme.onGroundColor,
      ),
    );
  }
}

class BodyMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const BodyMedium({
    Key? key,
    required this.text,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color ?? appTheme.onGroundColor,
      ),
    );
  }
}

class BodySmall extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const BodySmall({
    Key? key,
    required this.text,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: color ?? appTheme.onGroundColor,
      ),
    );
  }
}

class HeadlineLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const HeadlineLarge({
    Key? key,
    required this.text,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: color ?? appTheme.onGroundColor,
      ),
    );
  }
}

class HeadlineMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const HeadlineMedium({
    Key? key,
    required this.text,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: color ?? appTheme.onGroundColor,
      ),
    );
  }
}

class HeadlineSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const HeadlineSmall({
    Key? key,
    required this.text,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: color ?? appTheme.onGroundColor,
      ),
    );
  }
}
