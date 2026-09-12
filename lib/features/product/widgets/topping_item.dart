import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_images.dart';

class ToppingItem extends StatelessWidget {
  const ToppingItem({
    super.key,
    this.label = 'Tomato',
    this.imagePath = AppImages.tomato,
  });

  final String label;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135.w,
      height: 140.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff3A2018),
              borderRadius: BorderRadius.circular(16.r),
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 14.w, bottom: 20.h),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
          ),
          buildPositionedImage(),
          buildPositionedAddIcon(),
        ],
      ),
    );
  }

  Positioned buildPositionedAddIcon() {
    return Positioned(
      bottom: 23.h,
      right: 10.w,
      child: Container(
        padding: EdgeInsets.only(bottom: 4, top: 2),
        height: 24.h,
        width: 24.h,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: Colors.white, size: 20.sp),
      ),
    );
  }

  Positioned buildPositionedImage() {
    return Positioned(
      top: -17.h,
      child: Container(
        width: 135.w,
        height: 90.h,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.26),
              offset: Offset(-3.w, -2.h),
              blurRadius: 10.r,
              spreadRadius: 0.2.r,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.16),
              offset: Offset(2.w, -3.h),
              blurRadius: 10.r,
              spreadRadius: 0.2.r,
            ),
          ],
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
