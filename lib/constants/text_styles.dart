import 'package:flutter/material.dart';

import '/constants/app_colors.dart';

@immutable
class TextStyles {
  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const subtitleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const largeSubtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );
}
