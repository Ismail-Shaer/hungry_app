import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/cart/data/card_model.dart';
import 'package:hungry_app/features/cart/widgets/card_item.dart';
import 'package:hungry_app/features/checkout/views/checkout_view.dart';
import 'package:hungry_app/shared/widgets/bottom_total_bar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 25.sp,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Gap(15.h),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CardItem(
                        image: item.image,
                        title: item.title,
                        desc: item.desc,
                        quantity: item.quantity,
                        onAdd: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                        onMinus: () {
                          if (item.quantity > 1) {
                            setState(() {
                              item.quantity--;
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              Gap(150.h),
            ],
          ),
        ),
        bottomSheet: BottomTotalBar(
          total: '\$ 12.99',
          buttonText: 'CheckOut',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckoutView()),
            );
          },
        ),
      ),
    );
  }
}
