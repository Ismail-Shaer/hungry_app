import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central text styles for the whole app.
///
/// Every text in the app should pull from here through
/// `Theme.of(context).textTheme` (a.k.a. `TextTheme.of(context)`),
/// e.g. `TextTheme.of(context).titleLarge`, and use `.copyWith(...)`
/// for one-off tweaks (color / size / weight).
///
/// The whole theme uses the Fredoka font. Sizes use `.sp` so they stay
/// responsive; this must be built inside the `ScreenUtilInit` builder.
class AppTextTheme {
  const AppTextTheme._();

  static const Color _defaultColor = Colors.black;

  static TextTheme build() {
    final textTheme = TextTheme(
      // Big headers / hero text
      displayMedium: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w400,
      ), // dialog titles
      displaySmall: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ), // total price, signup title
      // Headlines
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ), // login title
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ), // prices, section values
      // Titles
      titleLarge: TextStyle(
        fontSize: 19.sp,
        fontWeight: FontWeight.w700,
      ), // section headers
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ), // card / list titles
      titleSmall: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      ), // small card titles
      // Body
      bodyLarge: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ), // greetings, general body
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ), // descriptions, summary rows
      bodySmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ), // captions, subtitles
      // Labels (buttons / chips / nav)
      labelLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ), // primary buttons
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ), // nav labels, small emphasis
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ), // tiny links
    ).apply(bodyColor: _defaultColor, displayColor: _defaultColor);

    // Apply the Fredoka font to every style while keeping sizes/weights/colors.
    return GoogleFonts.fredokaTextTheme(textTheme);
  }
}
