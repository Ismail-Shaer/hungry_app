import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_images.dart';
import 'package:hungry_app/features/home/widgets/search_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppImages.logo,
                  height: 30.h,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(10.h),

                Text(
                  "Hello, Rich Sonic",
                  style: TextTheme.of(
                    context,
                  ).bodyLarge?.copyWith(color: Colors.grey),
                ),
              ],
            ),
            CircleAvatar(
              radius: 36.r,
              backgroundImage: AssetImage(AppImages.profileAvatar),
            ),
          ],
        ),
        Gap(20.h),
        //search bar
        SearchField(),
      ],
    );
  }
}
