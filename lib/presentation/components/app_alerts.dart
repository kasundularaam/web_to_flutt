import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/themes/app_colors.dart';
import 'app_texts.dart';

showInfoBar(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(
    content: Row(
      children: [
        Expanded(
          child: BodySmall(
            text: message,
            color: AppColors.darkOnGroundColorLow,
          ),
        ),
        Icon(
          Icons.info_rounded,
          color: AppColors.info,
          size: 30.sp,
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showErrorBar(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(
    content: Row(
      children: [
        Expanded(
          child: BodySmall(
            text: message,
            color: AppColors.darkOnGroundColorLow,
          ),
        ),
        Icon(
          Icons.error_rounded,
          color: AppColors.error,
          size: 30.sp,
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSucceedBar(BuildContext context, String message) {
  SnackBar snackBar = SnackBar(
    content: Row(
      children: [
        Expanded(
          child: BodySmall(
            text: message,
            color: AppColors.darkOnGroundColorLow,
          ),
        ),
        Icon(
          Icons.check_circle_rounded,
          color: AppColors.succeed,
          size: 30.sp,
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
