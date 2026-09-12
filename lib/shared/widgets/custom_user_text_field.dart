import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserTextFiled extends StatelessWidget {
  const CustomUserTextFiled({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  });

  final String labelText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.white,
      style: TextTheme.of(context).bodyLarge?.copyWith(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextTheme.of(context).titleMedium?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.white, width: 1.8.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.white, width: 1.8.w),
        ),
      ),
    );
  }
}
