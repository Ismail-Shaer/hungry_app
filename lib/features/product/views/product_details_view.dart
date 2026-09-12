import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_images.dart';
import 'package:hungry_app/features/cart/views/cart_view.dart';
import 'package:hungry_app/features/product/widgets/topping_item.dart';
import 'package:hungry_app/shared/widgets/bottom_total_bar.dart';

import '../widgets/details_header.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const List<String> _toppingLabels = [
    'Tomato',
    'Cheese',
    'Onion',
    'Lettuce',
    'Bacon',
  ];

  static const List<String> _toppingImages = [
    AppImages.tomato,
    AppImages.burger1,
    AppImages.burger2,
    AppImages.burger3,
    AppImages.burger4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //burger image, description and spicy level
              DetailsHeader(),
              //toppings
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(30.h),
                    //toppings
                    Text(
                      'Toppings',
                      style: TextTheme.of(
                        context,
                      ).displayMedium,
                    ),
                    Gap(5.h),
                    SizedBox(
                      height: 180.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Row(
                            children: List.generate(
                              _toppingLabels.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: ToppingItem(
                                  label: _toppingLabels[index],
                                  imagePath: _toppingImages[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(15.h),
                    Text(
                      'Side Options',
                      style: TextTheme.of(
                        context,
                      ).displayMedium
                    ),
                    SizedBox(
                      height: 180.h,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Row(
                            children: List.generate(
                              _toppingLabels.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: ToppingItem(
                                  label: _toppingLabels[index],
                                  imagePath: _toppingImages[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(150.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomTotalBar(
        total: '\$ 12.99',
        buttonText: 'Add To Cart',
        onPressed:
            () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => CartView())),
      ),
    );
  }
}
