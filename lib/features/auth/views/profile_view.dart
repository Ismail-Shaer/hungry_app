import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_images.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/features/checkout/data/payment_method_model.dart';
import 'package:hungry_app/features/checkout/widgets/payment_method_tile.dart';
import 'package:hungry_app/shared/widgets/custom_user_text_field.dart';

import '../widgets/profile_image.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  // The visa tile is selected (matches img_15).
  int _selectedPaymentIndex = 1;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      toolbarHeight: 50.h,
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_rounded, size: 25.sp, color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(AppImages.settingsIcon, width: 22.w),
        ),
      ],
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar,
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: ProfileImage()),
                  Gap(20.h),
                  CustomUserTextFiled(
                    labelText: "Name",
                    controller: _nameController,
                  ),
                  Gap(20.h),
                  CustomUserTextFiled(
                    labelText: "Email",
                    controller: _emailController,
                  ),
                  Gap(20.h),
                  CustomUserTextFiled(
                    labelText: "Delivery address",
                    controller: _passwordController,
                  ),
                  Gap(20.h),

                  CustomUserTextFiled(
                    labelText: "Password",
                    obscureText: true,
                    controller: _addressController,
                  ),
                  Gap(20.h),
                  Divider(color: Colors.grey, thickness: 1.6.h),
                  Gap(20.h),
                  // Reuse the same visa tile from the checkout view.
                  PaymentMethodTile(
                    paymentMethodModel: paymentMethods[1],
                    tileColor: AppColors.unselectedTileColor,
                    titleColor: Colors.black87,
                    subtitleFontWeight: FontWeight.bold,
                    subtitleColor: Colors.grey,
                    value: 1,
                    groupValue: _selectedPaymentIndex,
                    onChanged: (index) {
                      setState(() {
                        _selectedPaymentIndex = index;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: _buildActionSheet(),
      ),
    );
  }

  //bottom sheet with two buttons: Edit Profile and Log out
  Widget _buildActionSheet() {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 24.h),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: CustomAuthButton(
                text: "Edit Profile",
                color: AppColors.primaryColor,
                textColor: Colors.white,
                icon: Icons.edit_square,
                onTap: () {},
              ),
            ),
            Gap(16.w),
            Expanded(
              child: CustomAuthButton(
                text: "Log out",
                color: Colors.white,
                textColor: AppColors.primaryColor,
                icon: Icons.logout,
                border: Border.all(color: AppColors.primaryColor, width: 1.6.w),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
