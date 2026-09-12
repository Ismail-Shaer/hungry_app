import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_images.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.profileAvatar),
          fit: BoxFit.cover,
        ),
        color: Colors.grey,
        border: Border.all(color: Colors.white, width: 3.w),
        borderRadius: BorderRadius.circular(17.r),
      ),
    );
  }
}
