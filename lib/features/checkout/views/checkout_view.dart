import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/data/payment_method_model.dart';
import 'package:hungry_app/features/checkout/widgets/payment_method_tile.dart';
import 'package:hungry_app/features/checkout/widgets/save_card_checkbox.dart';
import 'package:hungry_app/features/checkout/widgets/summary_order.dart';
import 'package:hungry_app/shared/widgets/bottom_total_bar.dart';
import 'package:hungry_app/features/checkout/widgets/success_dialog.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int selectedPaymentIndex = 0;

  // This variable remembers if the "Save card details" checkbox
  // is ticked or not.
  // It starts as `true` so it matches the design, but you can change it
  // to `false` if you want the box to start empty instead.
  bool saveCardDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // A fixed bar (Total + "Place Order" button) that stays pinned to
      // the bottom of the screen, on top of the scrollable content below.
      bottomSheet: BottomTotalBar(
        total: '\$18.19',
        buttonText: 'Pay Now',
        // `showDialog` is a built-in Flutter function: it takes the
        // BuildContext (so it knows which screen/Navigator to show the
        // popup on top of) and a `builder` callback that returns the
        // widget to display — here, our SuccessDialog card.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const SuccessDialog(),
          );
        },
      ),
      body: SafeArea(
        // Scrollable so content is never hidden behind the bottomSheet
        // above, and so the screen still works on smaller devices.
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order summary', style: TextTheme.of(context).titleLarge),
                Gap(20.h),
                const SummaryOrder(title: 'Order', value: '\$16.48'),
                Gap(12.h),
                const SummaryOrder(title: 'Taxes', value: '\$0.3'),
                Gap(12.h),
                const SummaryOrder(title: 'Delivery fees', value: '\$1.5'),
                Gap(16.h),
                const Divider(thickness: 2, endIndent: 10, indent: 10),
                Gap(16.h),
                const SummaryOrder(
                  title: 'Total:',
                  value: '\$18.19',
                  isBold: true,
                ),
                Gap(8.h),
                const SummaryOrder(
                  title: 'Estimated delivery time:',
                  value: '15 - 30 min',
                  isBold: true,
                ),
                Gap(8.h),

                const Divider(thickness: 2, endIndent: 10, indent: 10),

                Gap(20.h),
                Text('Payment method', style: TextTheme.of(context).titleLarge),
                Gap(20.h),

                PaymentMethodTile(
                  paymentMethodModel: paymentMethods[0],
                  tileColor: AppColors.selectedTileColor,
                  titleColor: Colors.white,
                  value: 0,
                  groupValue: selectedPaymentIndex,
                  onChanged: (index) {
                    setState(() {
                      selectedPaymentIndex = index;
                    });
                  },
                ),
                Gap(20.h),
                PaymentMethodTile(
                  paymentMethodModel: paymentMethods[1],
                  tileColor: AppColors.unselectedTileColor,
                  titleColor: Colors.black87,
                  subtitleFontWeight: FontWeight.bold,
                  subtitleColor: Colors.grey,
                  value: 1,
                  groupValue: selectedPaymentIndex,
                  onChanged: (index) {
                    setState(() {
                      selectedPaymentIndex = index;
                    });
                  },
                ),
                Gap(12.h),

                // Row with the checkbox + "Save card details..." text.
                // It sits right under the debit card option, like in the design.
                SaveCardCheckbox(
                  // We READ the current value from our state variable...
                  value: saveCardDetails,
                  // ...and here we LISTEN for taps and WRITE the new value
                  // back into that same state variable.
                  onChanged: (newValue) {
                    setState(() {
                      saveCardDetails = newValue;
                    });
                  },
                ),
                // Extra space so the bottomSheet bar doesn't cover this
                // last row once the user scrolls all the way down.
                Gap(140.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
