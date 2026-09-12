import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_images.dart';
import 'package:hungry_app/shared/widgets/custom_button.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 50.h),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                color: Colors.white60,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.burger1, width: 120.w),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hamburger",
                                  style: TextTheme.of(context).titleMedium,
                                ),
                                Gap(6.h),
                                Text(
                                  "Qty: x3",
                                  style: TextTheme.of(context).titleMedium
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                                Gap(4.h),
                                Text(
                                  "Price: \$12.5",
                                  style: TextTheme.of(context).titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(17.h),
                      CustomButton(
                        text: "Re Order",
                        onTap: () {},
                        width: double.infinity,
                      ),
                      Gap(17.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
