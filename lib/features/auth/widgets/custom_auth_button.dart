import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.icon,
    this.border,
  });

  final String text;
  final VoidCallback onTap;

  // Background color of the button. Defaults to white so existing screens
  // (like LoginView) keep looking exactly the same.
  final Color color;

  // Text color. Defaults to black to preserve the old look.
  final Color textColor;

  // Optional trailing icon (e.g. an arrow) shown after the label.
  final IconData? icon;

  // Optional outline. Lets an otherwise-white button stay visible when it
  // sits on a white surface (e.g. the "Log out" button on the profile sheet).
  // Defaults to null so existing buttons keep their borderless look.
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.r),
          border: border,
        ),
        // Center the label; if an icon was given, place it just after the text.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextTheme.of(
                  context,
                ).labelLarge?.copyWith(color: textColor),
              ),
            ),
            if (icon != null) ...[
              Gap(20.w),
              Icon(icon, color: textColor, size: 20.sp),
            ],
          ],
        ),
      ),
    );
  }
}
