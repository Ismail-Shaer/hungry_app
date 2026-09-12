import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/widgets/custom_button.dart';

// A reusable bottom bar that shows the order total on the left and an
// action button on the right (e.g. "Add To Cart", "CheckOut", "Place Order").
//
// Used as a Scaffold's `bottomSheet:` on product details, cart, and
// checkout so those three screens all share one consistent look instead
// of each copy-pasting the same Container.
class BottomTotalBar extends StatelessWidget {
  const BottomTotalBar({
    super.key,
    required this.total,
    required this.buttonText,
    required this.onPressed,
  });

  // Already-formatted price text, e.g. '\$ 12.99'.
  final String total;

  // Label shown on the action button, e.g. 'Add To Cart' or 'CheckOut'.
  final String buttonText;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        // Solid white instead of the old translucent Colors.white60/30,
        // which looked washed out sitting on the app's white background.
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        // A soft shadow lifts the bar off the page content above it,
        // giving it depth instead of relying on a barely-visible tint.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextTheme.of(
                  context,
                ).titleLarge?.copyWith(color: Colors.black38),
              ),
              Gap(6.h),
              Text(
                total,
                style: TextTheme.of(
                  context,
                ).displayMedium?.copyWith(color: AppColors.primaryColor,fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomButton(text: buttonText, onTap: onPressed, width: 160.w),
        ],
      ),
    );
  }
}
