import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/checkout/data/payment_method_model.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.paymentMethodModel,
    required this.tileColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.bold,
    this.subtitleColor = Colors.grey,
    this.subtitleFontWeight = FontWeight.normal,
  });

  final PaymentMethodModel paymentMethodModel;
  final Color tileColor;

  // The index of this tile
  final int value;
  // The index of the currently selected tile
  final int groupValue;
  final ValueChanged<int> onChanged;

  // Text styling, controlled per tile from the caller (see checkout_view.dart)
  final Color titleColor;
  final FontWeight titleFontWeight;
  final Color subtitleColor;
  final FontWeight subtitleFontWeight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
      tileColor: tileColor,
      // Fixed square-ish box + BoxFit.contain so the icon actually scales
      // when you resize it, instead of just growing empty transparent space.
      leading: SizedBox(
        width: 70.w,
        height: 70.h,

        child: Image.asset(paymentMethodModel.iconPath, fit: BoxFit.fitWidth),
      ),
      title: Text(
        paymentMethodModel.title,
        style: TextTheme.of(
          context,
        ).bodyLarge?.copyWith(fontWeight: titleFontWeight, color: titleColor),
      ),
      subtitle:
          paymentMethodModel.subtitle != null
              ? Text(
                paymentMethodModel.subtitle!,
                style: TextTheme.of(context).bodySmall?.copyWith(
                  fontWeight: subtitleFontWeight,
                  color: subtitleColor,
                ),
              )
              : null,
      trailing: Radio<int>(
        value: value,
        groupValue: groupValue,
        activeColor: Colors.white,
        onChanged: (selected) => onChanged(selected!),
      ),
      onTap: () => onChanged(value),
    );
  }
}
