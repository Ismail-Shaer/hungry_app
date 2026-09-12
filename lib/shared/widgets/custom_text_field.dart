import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    required this.validator,
    this.prefixIcon,
    this.fillColor = Colors.white,
    this.verticalPadding,
  });

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  final String? Function(String?) validator;

  // Optional leading icon shown at the start of the field (e.g. a person icon).
  final IconData? prefixIcon;

  // Background color of the field. Defaults to white so existing screens
  // (like LoginView) keep looking exactly the same.
  final Color fillColor;

  // Optional vertical content padding. Lets a dense screen (like the no-scroll
  // SignupView) make the fields shorter. Null keeps the original 18.h so
  // existing screens are unchanged.
  final double? verticalPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextTheme.of(context).titleSmall,
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: widget.fillColor,
        // Show the leading icon only when one was provided.
        prefixIcon:
            widget.prefixIcon != null
                ? Icon(
                  widget.prefixIcon,
                  color: Colors.grey.shade600,
                  size: 22.sp,
                )
                : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: widget.verticalPadding ?? 18.h,
        ),
        errorStyle: TextTheme.of(
          context,
        ).bodySmall?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                    size: 22.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : null,
      ),
    );
  }
}
