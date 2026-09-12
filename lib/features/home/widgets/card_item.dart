import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_images.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            SizedBox(height: 130.h, child: Image.asset(AppImages.burger1)),
            Gap(5.h),
            //title
            Text("Cheese Burger", style: TextTheme.of(context).titleSmall),
            Text(
              "Wendy's Burger",
              style: TextTheme.of(context).bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade500,
              ),
            ),
            Gap(9.h),
            //price
            Text(
              "⭐ 5.99",
              style: TextTheme.of(
                context,
              ).titleMedium?.copyWith(color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
