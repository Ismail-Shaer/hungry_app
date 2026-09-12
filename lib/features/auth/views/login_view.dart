import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_images.dart';
import 'package:hungry_app/features/auth/validators/auth_validators.dart';
import 'package:hungry_app/features/auth/views/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/shared/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Same light grey fill used on the signup fields, so both screens match.
  static const Color _fieldFill = Color(0xFFF3F3F3);

  // The white card starts a bit above where the green header ends, so it
  // overlaps the header just like the signup screen (header is ~220.h tall).
  double get _cardTop => 200.h;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Let the card fill down to the bottom of the screen when the
              // content is short, but still grow and scroll when needed.
              final double cardMinHeight = (constraints.maxHeight - _cardTop)
                  .clamp(0.0, double.infinity);
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Stack(
                  children: [
                    _buildHeader(),
                    Padding(
                      padding: EdgeInsets.only(top: _cardTop),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: cardMinHeight),
                        child: _buildFormCard(context),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------- HEADER
  Widget _buildHeader() {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
      child: Row(
        children: [
          // Logo + short welcome line on the left.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppImages.logo, width: 160.w),
                Gap(12.h),
                Text(
                  "Welcome back!\n you've been missed!",
                  style: TextTheme.of(
                    context,
                  ).bodyLarge?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          // Bag + burger art on the right (bag behind, burger in front).
          SizedBox(
            width: 150.w,
            height: 150.h,
            child: Stack(
              children: [
                Image.asset(AppImages.bag, width: 180.w),
                Positioned(
                  top: 80.h,
                  child: Image.asset(AppImages.burgerGpt, width: 77.w),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------- FORM
  Widget _buildFormCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back",
            style: TextTheme.of(
              context,
            ).headlineMedium?.copyWith(color: AppColors.primaryColor),
          ),
          Gap(4.h),
          Text(
            "Sign in to continue",
            style: TextTheme.of(
              context,
            ).bodyLarge?.copyWith(color: Colors.grey.shade600),
          ),
          Gap(20.h),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "Email Address",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: AuthValidators.email,
                  prefixIcon: Icons.mail_outline,
                  fillColor: _fieldFill,
                  verticalPadding: 14.h,
                ),
                Gap(14.h),
                CustomTextFormField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true,
                  validator: AuthValidators.password,
                  prefixIcon: Icons.lock_outline,
                  fillColor: _fieldFill,
                  verticalPadding: 14.h,
                ),
              ],
            ),
          ),
          Gap(8.h),
          // Right-aligned "Forgot?" link.
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Handle forgot password
              },
              child: Text(
                "Forgot password?",
                style: TextTheme.of(
                  context,
                ).labelMedium?.copyWith(color: AppColors.primaryColor),
              ),
            ),
          ),
          Gap(24.h),
          CustomAuthButton(
            text: "Sign in",
            color: AppColors.primaryColor,
            textColor: Colors.white,
            icon: Icons.arrow_forward,
            onTap: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                // Perform login action
              }
            },
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(color: Colors.grey.shade600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupView()),
                  );
                },
                child: Text(
                  "Sign up",
                  style: TextTheme.of(
                    context,
                  ).headlineSmall?.copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
