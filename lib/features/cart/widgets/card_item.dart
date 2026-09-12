import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/custom_button.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.onAdd,
    this.onMinus,
    this.onRemove,
    required this.quantity,
  });

  final String image;
  final String title;
  final String desc;
  final VoidCallback? onAdd;
  final VoidCallback? onMinus;
  final VoidCallback? onRemove;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // img & 2 txt
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, width: 120.w),
                Text(title, style: TextTheme.of(context).titleMedium),
                Text(desc, style: TextTheme.of(context).bodyMedium),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onAdd,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                          size: 30.w,
                        ),
                      ),
                    ),
                    Gap(15.w),
                    Text(
                      quantity.toString(),
                      style: TextTheme.of(context).headlineSmall,
                    ),
                    Gap(15.w),
                    GestureDetector(
                      onTap: onMinus,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          CupertinoIcons.minus,
                          color: Colors.white,
                          size: 30.w,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(15.h),
                CustomButton(
                  text: "Remove",
                  onTap: onRemove ?? () {},
                  width: 160.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
