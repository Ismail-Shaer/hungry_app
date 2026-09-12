import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_images.dart';
import 'package:hungry_app/features/auth/validators/auth_validators.dart';
import 'package:hungry_app/features/auth/views/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/shared/widgets/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Layout anchor (design px on the 375x812 ScreenUtil canvas). The green
  // header owns the top; the white card is stacked ON TOP of it and starts a
  // little higher than the header ends, so the card overlaps the green and
  // looks like it is floating over it. Header is ~320.h tall, so this leaves
  // ~45.h of overlap into the header.
  double get _cardTop => 275.h;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Tap anywhere empty to close the keyboard.
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // Green fills the top + the overlap; the white card paints the rest.
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          bottom: false,
          // LayoutBuilder gives us the real viewport height so the white card
          // can stretch to fill the screen (min height) while still being
          // free to grow taller and scroll when space runs out.
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double cardMinHeight = (constraints.maxHeight - _cardTop)
                  .clamp(0.0, double.infinity);
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Stack(
                  children: [
                    // 1) Green header at the top.
                    const _SignupHeader(),
                    // 2) White form card layered on top of the header,
                    //    overlapping its lower edge. The ConstrainedBox keeps
                    //    the white filling down to the bottom of the screen
                    //    when the content is short.
                    Padding(
                      padding: EdgeInsets.only(top: _cardTop),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: cardMinHeight),
                        child: _SignupFormCard(
                          formKey: formKey,
                          nameController: nameController,
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                        ),
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
}

// ---------------------------------------------------------------------- HEADER
class _SignupHeader extends StatelessWidget {
  const _SignupHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBrandRow(context),
          Gap(8.h),
          _buildFeatureRow(context),
        ],
      ),
    );
  }

  // Top row: the HUNGRY? logo + tagline on the left, the bag art on the right.
  Widget _buildBrandRow(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Expanded(child: _buildLogoBlock(context)), _buildBagArt()],
      ),
    );
  }

  // The logo, a green sparkle at its top-right, and the tagline underneath.
  Widget _buildLogoBlock(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bigger logo. Given a width only, it keeps its aspect ratio
            // (256x46) so nothing is clipped or stretched.
            SvgPicture.asset(AppImages.logo, width: 172.w),
            Gap(10.h),
            Text(
              "Fresh food, fast delivery",
              style: TextTheme.of(
                context,
              ).bodyMedium?.copyWith(color: Colors.white70),
            ),
          ],
        ),
        // Green sparkle tucked at the top-right of the HUNGRY? logo.
        Positioned(
          top: -40.h,
          left: 150.w,
          child: Image.asset(
            AppImages.threeLinesG,
            width: 50.w,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }

  // The paper bag, burger and a yellow sparkle, layered with a Stack.
  // In a Stack, children are painted back-to-front (first = behind).
  Widget _buildBagArt() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SizedBox(
        width: 140.w,
        height: 140.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 1) Yellow sparkle sitting BEHIND the bag, peeking out near the top
            //    right corner of the bag.
            Positioned(
              top: 2.h,
              right: -5.w,
              child: Image.asset(
                AppImages.threeLinesY,
                width: 50.w,
                filterQuality: FilterQuality.high,
              ),
            ),
            // 2) The paper bag.
            Positioned(
              right: -15.w,
              bottom: -20.h,
              child: Image.asset(
                AppImages.bag,
                width: 160.w,
                filterQuality: FilterQuality.high,
              ),
            ),
            // 3) The burger, in front, overlapping the bag's base.
            Positioned(
              left: -5.w,
              bottom: -30.h,
              child: Image.asset(
                AppImages.burgerGpt,
                width: 82.w,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // The three feature circles (one image) + a label under each circle.
  Widget _buildFeatureRow(BuildContext context) {
    return Center(
      child: SizedBox(
        // Match the label row width to the image width so labels line up
        // exactly under each circle.
        width: 240.w,
        child: Column(
          children: [
            Image.asset(
              AppImages.rowIcons,
              width: 200.w,
              filterQuality: FilterQuality.high,
            ),
            Row(
              children: [
                _featureLabel(context, "Fresh\nIngredients"),
                _featureLabel(context, "Fast\nDelivery"),
                _featureLabel(context, "Good\nFood"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureLabel(BuildContext context, String text) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextTheme.of(
          context,
        ).labelSmall?.copyWith(color: Colors.white, height: 1.3),
      ),
    );
  }
}

// ------------------------------------------------------------------------ FORM
class _SignupFormCard extends StatelessWidget {
  const _SignupFormCard({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  // A very light grey used to fill the input fields on the white card.
  static const Color _fieldFill = Color(0xFFF3F3F3);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        // Rounded top = the curved divider where the card meets the green.
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      padding: EdgeInsets.fromLTRB(24.w, 22.h, 24.w, 14.h),
      child: Column(
        children: [
          Text(
            "Create your account",
            style: TextTheme.of(
              context,
            ).displaySmall?.copyWith(color: AppColors.primaryColor),
          ),
          Gap(4.h),
          Text(
            "Join HUNGRY? and get your favorite food delivered to your door.",
            textAlign: TextAlign.start,
            style: TextTheme.of(context).bodySmall?.copyWith(
              color: Colors.grey.shade500,
              height: 1.2,
            ),
          ),
          Gap(16.h),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "Name",
                  controller: nameController,
                  validator: AuthValidators.name,
                  prefixIcon: Icons.person_outline,
                  fillColor: _fieldFill,
                  verticalPadding: 14.h,
                ),
                Gap(12.h),
                CustomTextFormField(
                  hintText: "Email Address",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: AuthValidators.email,
                  prefixIcon: Icons.mail_outline,
                  fillColor: _fieldFill,
                  verticalPadding: 14.h,
                ),
                Gap(12.h),
                CustomTextFormField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true,
                  validator: AuthValidators.password,
                  prefixIcon: Icons.lock_outline,
                  fillColor: _fieldFill,
                  verticalPadding: 14.h,
                ),
                Gap(12.h),
                CustomTextFormField(
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator:
                      (value) => AuthValidators.confirmPassword(
                        value,
                        passwordController.text,
                      ),
                  prefixIcon: Icons.lock_outline,
                  fillColor: _fieldFill,
                  verticalPadding: 14.h,
                ),
              ],
            ),
          ),

          Gap(15.h),
          CustomAuthButton(
            text: "Sign up",
            color: AppColors.primaryColor,
            textColor: Colors.white,
            icon: Icons.arrow_forward,
            onTap: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                // Perform signup action
              }
            },
          ),
          Gap(14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(color: Colors.grey.shade600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginView()),
                  );
                },
                child: Text(
                  "Sign in",
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
