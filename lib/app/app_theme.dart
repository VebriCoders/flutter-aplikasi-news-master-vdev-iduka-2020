import 'package:flutter/material.dart';
import 'package:news_app_vebri_yusdi_flutter/app/app_colors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.textPrimary,
        backgroundColor: AppColors.background,
      );
}
