import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = AppColors.primaryColor,
    this.textColor = Colors.white,
    required this.width,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 55.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextTheme.of(
              context,
            ).labelMedium?.copyWith(color: textColor, fontSize: 17.sp),
          ),
        ),
      ),
    );
  }
}
