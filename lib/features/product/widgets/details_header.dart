import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/widgets/riched_text.dart';

import '../../../core/constants/app_images.dart';
import 'custom_slider.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(width: 150.w, AppImages.burgerDetails, fit: BoxFit.contain),
        Gap(35.w),
        SizedBox(
          width: 170.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichedText(),
              Gap(30.h),
              //spicy level
              Text('Spicy', style: TextTheme.of(context).titleMedium),
              const CustomSlider(),
            ],
          ),
        ),
      ],
    );
  }
}
