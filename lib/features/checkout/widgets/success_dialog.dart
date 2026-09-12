import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/widgets/custom_button.dart';

// A popup card that tells the user an action succeeded (used after
// "Place Order" is pressed on the checkout screen).
//
// It is just a plain widget, not a Scaffold/screen, because it is meant
// to be passed to Flutter's `showDialog()` — that function takes care of
// dimming the background and centering whatever widget we give it.
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Dialog it draws the white rounded card and
    // Flutter positions it in the middle of the screen
    // so we only have to build what goes *inside* the card.
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Green circle with a white checkmark inside it.
            CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.check, color: Colors.white, size: 50.sp),
            ),
            Gap(16.h),
            //success text
            Text(
              'Success !',
              style: TextTheme.of(
                context,
              ).displayMedium?.copyWith(color: AppColors.primaryColor),
            ),
            Gap(8.h),

            Text(
              'Your payment was successful.\n'
              'A receipt for this purchase has\n'
              'been sent to your email.',
              textAlign: TextAlign.center,
              style: TextTheme.of(context).bodySmall?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(24.h),
            CustomButton(
              text: 'Go Back',
              // `double.infinity` tells the button to stretch across all
              // the width the dialog card gives it, instead of shrinking
              // to fit the text (matches the wide button in the design).
              width: double.infinity,
              // `Navigator.pop` closes whatever was opened last on top
              // of the screen — here, that's this dialog itself.
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
