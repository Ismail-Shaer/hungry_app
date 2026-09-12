import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/widgets/category_list.dart';
import 'package:hungry_app/features/home/widgets/home_header.dart';
import 'package:hungry_app/features/product/views/product_details_view.dart';

import '../widgets/card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> _categories = const [
    'All',
    'Combos',
    'Sliders',
    'Classics',
  ];
  int _selectedCategoryIndex = 0;

  void onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(50.h),
                    const HomeHeader(),
                    Gap(30.h),
                    //categories
                    CategoryList(
                      categories: _categories,
                      selectedIndex: _selectedCategoryIndex,
                      onCategorySelected: onCategorySelected,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              sliver: SliverGrid.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsView(),
                          ),
                        ),
                    child: CardItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
