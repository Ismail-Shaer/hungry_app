import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_theme.dart';

/// Global app theme. Build it inside the `ScreenUtilInit` builder so that
/// `.sp` sizing resolves correctly.
class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.build(),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        indicatorColor: Colors.white12,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            size: 25.sp,
          );
        }),
        labelPadding: EdgeInsets.only(top: 8.h),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontSize: 13.8.sp,
            fontWeight: FontWeight.w700,
          );
        }),
      ),
    );
  }
}
